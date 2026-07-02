import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfileScreen({
    super.key,
    required this.userData,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController fullNameController;
  late TextEditingController universityController;
  late TextEditingController courseController;
  late TextEditingController roleController;
  late TextEditingController emailController;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    fullNameController =
        TextEditingController(text: widget.userData["fullName"]);
    universityController =
        TextEditingController(text: widget.userData["university"]);
    courseController =
        TextEditingController(text: widget.userData["course"]);
    roleController =
        TextEditingController(text: widget.userData["role"]);
    emailController =
        TextEditingController(text: widget.userData["email"]);
  }

  Future<void> saveProfile() async {
    setState(() => isSaving = true);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .update({
      "fullName": fullNameController.text,
      "university": universityController.text,
      "course": courseController.text,
      "role": roleController.text,
      "email": emailController.text,
    });

    setState(() => isSaving = false);

    Navigator.pop(context);
  }

  Widget buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildField("Full Name", fullNameController),
              buildField("University", universityController),
              buildField("Course / Major", courseController),
              buildField("Preferred Job Role", roleController),
              buildField("Email", emailController),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isSaving ? null : saveProfile,
                  child: isSaving
                      ? const CircularProgressIndicator(
                          color: Colors.white)
                      : const Text("Save Changes"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}