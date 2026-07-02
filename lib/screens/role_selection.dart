import 'package:flutter/material.dart';
import 'instructions.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedRole;

  final List<Map<String, String>> roles = [
    {"title": "Software Engineer", "difficulty": "Hard", "value": "software engineer"},
    {"title": "QA Engineer", "difficulty": "Medium", "value": "qa engineer"},
    {"title": "Security Analyst", "difficulty": "Hard", "value": "security analyst"},
    {"title": "Network Engineer", "difficulty": "Medium", "value": "network engineer"},
    {"title": "Data Analyst", "difficulty": "Medium", "value": "data analyst"},
    {"title": "Cloud Engineer", "difficulty": "Hard", "value": "cloud engineer"},
    {"title": "DevOps Engineer", "difficulty": "Hard", "value": "devops engineer"},
    {"title": "AI Engineer", "difficulty": "Expert", "value": "ai engineer"},
    {"title": "Product Manager", "difficulty": "Medium", "value": "product manager"},
    {"title": "UI/UX Designer", "difficulty": "Medium", "value": "ui ux designer"},
  ];

  Color difficultyColor(String difficulty) {
    switch (difficulty) {
      case "Medium":
        return Colors.orange;
      case "Hard":
        return Colors.red;
      case "Expert":
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Interview Role")),
      backgroundColor: const Color(0xffF5F6FA),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Select the role you want to be interviewed for",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: roles.length,
              itemBuilder: (context, index) {
                final role = roles[index];
                final selected = selectedRole == role["value"];

                return Card(
                  elevation: selected ? 4 : 1,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: selected ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      role["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      role["difficulty"]!,
                      style: TextStyle(
                        color: difficultyColor(role["difficulty"]!),
                      ),
                    ),
                    trailing: selected
                        ? const Icon(Icons.check_circle, color: Colors.blue)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedRole = role["value"];
                      });
                    },
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: selectedRole == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InterviewInstructionScreen(
                              role: selectedRole!,
                            ),
                          ),
                        );
                      },
                child: const Text("Start Interview"),
              ),
            ),
          )
        ],
      ),
    );
  }
}