import 'package:flutter/material.dart';

import 'interview_session.dart';

class InterviewInstructionScreen extends StatelessWidget {
  final String role;

  const InterviewInstructionScreen({super.key, required this.role});

  Widget instruction(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 17))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(title: const Text("Interview Instructions")),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Icon(Icons.record_voice_over, size: 90, color: Colors.blue),

              const SizedBox(height: 25),

              const Text(
                "Before You Begin",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      instruction(
                        Icons.volume_off,
                        "Find a quiet environment with no distractions",
                      ),
                      instruction(
                        Icons.mic,
                        "Ensure microphone permissions are granted",
                      ),
                      instruction(
                        Icons.wifi,
                        "Stable internet connection required",
                      ),
                      instruction(
                        Icons.record_voice_over,
                        "Speak clearly and at a moderate pace",
                      ),
                      instruction(
                        Icons.quiz,
                        "Interview consists of 5 questions",
                      ),
                      instruction(
                        Icons.schedule,
                        "Average time per question: 2–3 minutes",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InterviewScreen(role: role),
                      ),
                    );
                  },
                  child: const Text(
                    "Start Interview",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
