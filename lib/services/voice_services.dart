import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  final SpeechToText _speech = SpeechToText();

  bool isReady = false;

  Future<void> init() async {
    isReady = await _speech.initialize();
  }

  Future<String> startListening() async {
    String result = "";

    await _speech.listen(
      onResult: (value) {
        result = value.recognizedWords;
      },
    );

    return result;
  }

  void stopListening() {
    _speech.stop();
  }
}