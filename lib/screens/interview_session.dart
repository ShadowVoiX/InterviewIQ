import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ai_processing.dart';

class InterviewScreen extends StatefulWidget {
  final String role;

  const InterviewScreen({super.key,required this.role});

  @override
  State<InterviewScreen> createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _speech = SpeechToText();

  List<String> questions = [];
  List<String> answers = [];

  int currentIndex = 0;
  bool isLoading = true;
  bool isListening = false;
  String currentTranscript = "";

  String? sessionId;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await _speech.initialize();
    await createSession();
    await generateQuestions();
  }

  Future<void> createSession() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await _firestore
        .collection("users")
        .doc(user.uid)
        .collection("interviews")
        .add({
      "role": widget.role,
      "createdAt": FieldValue.serverTimestamp(),
      "score": 0,
      "questions": [],
      "answers": [],
      "aiResults": "",
    });

    sessionId = doc.id;
  }

  Future<void> generateQuestions() async {
    final apiKey = dotenv.env['GROQ_API_KEY'];

    try {
      final res = await http.post(
        Uri.parse("https://api.groq.com/openai/v1/chat/completions"),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "llama-3.1-8b-instant",
          "messages": [
            {
              "role": "user",
              "content":
                  "Generate 5 interview questions for ${widget.role}. Return only numbered list."
            }
          ],
        }),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final text = data["choices"][0]["message"]["content"] as String;

        questions = text
            .split("\n")
            .where((e) => e.trim().isNotEmpty)
            .map((e) => e.replaceAll(RegExp(r'^\d+[\.\)]\s*'), '').trim())
            .toList();
      } else {
        questions = _fallback();
      }
    } catch (e) {
      questions = _fallback();
    }

    answers = List.filled(questions.length, "");
    setState(() => isLoading = false);
  }

  List<String> _fallback() => [
        "Tell me about yourself.",
        "What is OOP?",
        "Explain REST API.",
        "What is Flutter?",
        "Why should we hire you?"
      ];

  Future<void> toggleMic() async {
    if (!isListening) {
      setState(() {
        isListening = true;
        currentTranscript = "";
      });

      await _speech.listen(onResult: (result) {
        setState(() {
          currentTranscript = result.recognizedWords;
        });
      });
    } else {
      await _speech.stop();

      setState(() {
        isListening = false;
        answers[currentIndex] = currentTranscript;
      });

      await saveAnswer();
    }
  }

  Future<void> saveAnswer() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || sessionId == null) return;

    await _firestore
        .collection("users")
        .doc(user.uid)
        .collection("interviews")
        .doc(sessionId)
        .update({
      "questions": questions,
      "answers": answers,
    });
  }

  void next() {
    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void prev() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final progress = (currentIndex + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: Text(widget.role),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROGRESS BAR
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor:
                    const AlwaysStoppedAnimation(Color(0xff4F6EF7)),
              ),
            ),

            const SizedBox(height: 20),

            // QUESTION CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xff4F6EF7), Color(0xff7B3FF2)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question ${currentIndex + 1}/${questions.length}",
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    questions[currentIndex],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ANSWER BOX
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    answers[currentIndex].isEmpty
                        ? currentTranscript.isEmpty
                            ? "Tap the mic and start speaking..."
                            : currentTranscript
                        : answers[currentIndex],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MIC BUTTON
            GestureDetector(
              onTap: toggleMic,
              child: Container(
                width: isListening ? 110 : 100,
                height: isListening ? 110 : 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xff4F6EF7), Color(0xff7B3FF2)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BUTTONS
            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: prev,
                    child: const Text("Previous"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await saveAnswer();

                      if (currentIndex == questions.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AiProcessingScreen(
                              role: widget.role,
                              questions: questions,
                              answers: answers,
                              sessionId: sessionId!,
                            ),
                          ),
                        );
                      } else {
                        next();
                      }
                    },
                    child: Text(
                      currentIndex == questions.length - 1
                          ? "Analyze"
                          : "Next",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}