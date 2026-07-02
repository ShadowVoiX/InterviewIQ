import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> deleteAccount(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final uid = user.uid;

    try {
      //Delete Firestore user data
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .delete();

      //Delete interview history subcollection
      final interviews = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("interviews")
          .get();

      for (var doc in interviews.docs) {
        await doc.reference.delete();
      }

      //Delete Firebase Auth user
      await user.delete();

      // 4. Go back to login
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      // IMPORTANT: Firebase may require recent login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed to delete account. Please log in again and retry.",
          ),
        ),
      );
    }
  }

  void confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
          "This action is permanent. All your data will be deleted and cannot be recovered.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await deleteAccount(context);
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("App Version"),
              subtitle: Text("1.0.0"),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
              subtitle: const Text("Permanently remove your account"),
              onTap: () => confirmDelete(context),
            ),
          ],
        ),
      ),
    );
  }
}