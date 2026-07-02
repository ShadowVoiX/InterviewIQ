import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AiProcessingScreen extends StatefulWidget {
  final String role;
  final List<String> questions;
  final List<String> answers;
  final String sessionId;

  const AiProcessingScreen({
    super.key,
    required this.role,
    required this.questions,
    required this.answers,
    required this.sessionId,
  });

  @override
  State<AiProcessingScreen> createState() => _AiProcessingScreenState();
}

class _AiProcessingScreenState extends State<AiProcessingScreen> {
  bool isLoading = true;
  String feedback = "";
  int score = 0;

  @override
  void initState() {
    super.initState();
    analyze();
  }

  Future<void> analyze() async {
    final apiKey = dotenv.env['GROQ_API_KEY'];

    String formattedQA = "";

    for (int i = 0; i < widget.questions.length; i++) {
      formattedQA += """
Q${i + 1}: ${widget.questions[i]}
A${i + 1}: ${widget.answers[i]}

""";
    }

    final prompt = """
You are a strict FAANG interviewer.

For each question:
- Evaluate answer
- Give improvement suggestion

Also provide:
1. Overall Score (0–100)
2. Strengths
3. Weaknesses

Format clearly per question.

DATA:
$formattedQA
""";

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
            {"role": "user", "content": prompt}
          ]
        }),
      );

      final data = jsonDecode(res.body);
      final output = data["choices"][0]["message"]["content"];

      final match = RegExp(r'(\d{1,3})').firstMatch(output);
      if (match != null) {
        score = int.parse(match.group(0)!);
        if (score > 100) score = 100;
      }

      setState(() {
        feedback = output;
        isLoading = false;
      });

      await saveToFirestore();

    } catch (e) {
      setState(() {
        feedback = "Error: $e";
        isLoading = false;
      });
    }
  }

  Future<void> saveToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("interviews")
        .doc(widget.sessionId)
        .set({
      "score": score,
      "aiResults": feedback,
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text("AI Analysis Report"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // SCORE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff4F6EF7), Color(0xff7B3FF2)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Score: $score / 100",
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  return _qaCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qaCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Q${index + 1}: ${widget.questions[index]}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Your Answer:",
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            widget.answers[index].isEmpty
                ? "No answer given"
                : widget.answers[index],
          ),

          const SizedBox(height: 10),

          Text(
            "AI Feedback:",
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            "Detailed analysis included in overall report above.",
          ),
        ],
      ),
    );
  }
}