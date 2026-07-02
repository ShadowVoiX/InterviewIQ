import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static Future<Map<String, dynamic>> analyzeAnswer({
    required String question,
    required String answer,
  }) async {
    final apiKey = dotenv.env['GROQ_API_KEY'];

    try {
      final response = await http.post(
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
              "content": """
You are an interview evaluator.

Question: $question
Answer: $answer

Return ONLY valid JSON (no markdown, no text):
{
  "score": 0,
  "feedback": "",
  "improved_answer": ""
}
"""
            }
          ],
          "temperature": 0.3,
        }),
      );

      if (response.statusCode != 200) {
        return {
          "score": 0,
          "feedback": "API error: ${response.statusCode} ${response.body}",
          "improved_answer": ""
        };
      }

      final data = jsonDecode(response.body);

      final content = data["choices"]?[0]?["message"]?["content"];

      if (content == null) {
        return {
          "score": 0,
          "feedback": "Empty AI response",
          "improved_answer": ""
        };
      }

      try {
        return jsonDecode(content);
      } catch (e) {
        // fallback if AI returns text instead of JSON
        return {
          "score": 0,
          "feedback": "Failed to parse AI response",
          "raw": content,
          "improved_answer": ""
        };
      }
    } catch (e) {
      return {
        "score": 0,
        "feedback": "Request failed: $e",
        "improved_answer": ""
      };
    }
  }
}