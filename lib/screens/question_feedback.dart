import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuestionFeedbackScreen extends StatefulWidget {
  final String sessionId;

  const QuestionFeedbackScreen({
    super.key,
    required this.sessionId,
  });

  @override
  State<QuestionFeedbackScreen> createState() =>
      _QuestionFeedbackScreenState();
}

class _QuestionFeedbackScreenState extends State<QuestionFeedbackScreen> {
  Map<String, dynamic>? data;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadFromFirebase();
  }

  Future<void> loadFromFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("interviews")
        .doc(widget.sessionId)
        .get();

    if (doc.exists) {
      setState(() {
        data = doc.data();
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (data == null) {
      return const Scaffold(
        body: Center(child: Text("No data found")),
      );
    }

    final role = data!["role"] ?? "Interview";
    final score = data!["score"] ?? 0;
    final questions = List<String>.from(data!["questions"] ?? []);
    final answers = List<String>.from(data!["answers"] ?? []);
    final aiResults = data!["aiResults"] ?? "";

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: Text(role),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          ...List.generate(questions.length, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Q${index + 1}: ${questions[index]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
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
                    index < answers.length
                        ? answers[index]
                        : "No answer",
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              aiResults.toString().isEmpty
                  ? "No AI feedback available"
                  : aiResults.toString(),
              style: const TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}