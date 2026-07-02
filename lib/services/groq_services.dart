import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroqService {
  final String apiKey = dotenv.env['GROQ_API_KEY']!;
}