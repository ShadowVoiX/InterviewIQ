import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _db = FirebaseFirestore.instance;

  Future<void> saveTranscript(String text) async {
    await _db.collection("interview_answers").add({
      "text": text,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }
}