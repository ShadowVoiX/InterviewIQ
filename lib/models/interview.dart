import 'package:flutter/material.dart';

/// Overall performance bucket for a completed interview.
enum InterviewStatus { excellent, good, average }

extension InterviewStatusX on InterviewStatus {
  String get label {
    switch (this) {
      case InterviewStatus.excellent:
        return 'Excellent';
      case InterviewStatus.good:
        return 'Good';
      case InterviewStatus.average:
        return 'Average';
    }
  }

  /// Main color used for the score ring, badge text, etc.
  Color get color {
    switch (this) {
      case InterviewStatus.excellent:
        return const Color(0xFF16A34A); // green
      case InterviewStatus.good:
        return const Color(0xFF2563EB); // blue
      case InterviewStatus.average:
        return const Color(0xFFEA8C00); // amber/orange
    }
  }

  /// Light background used behind the status pill.
  Color get backgroundColor {
    switch (this) {
      case InterviewStatus.excellent:
        return const Color(0xFFDCFCE7);
      case InterviewStatus.good:
        return const Color(0xFFDCEAFE);
      case InterviewStatus.average:
        return const Color(0xFFFEF3C7);
    }
  }

  /// Derive a status from a raw 0-100 score, in case you want to
  /// compute this instead of hardcoding it per interview.
  static InterviewStatus fromScore(int score) {
    if (score >= 85) return InterviewStatus.excellent;
    if (score >= 70) return InterviewStatus.good;
    return InterviewStatus.average;
  }
}

/// A single Q&A pair with the AI's scoring + feedback for that answer.
class QuestionFeedback {
  final int number;
  final String question;
  final int score;
  final String transcript;
  final String aiFeedback;

  const QuestionFeedback({
    required this.number,
    required this.question,
    required this.score,
    required this.transcript,
    required this.aiFeedback,
  });
}

/// A single completed mock-interview session.
class Interview {
  final String id;
  final String role;
  final DateTime date;
  final int durationMinutes;
  final int score;
  final InterviewStatus status;
  final List<QuestionFeedback> questions;

  const Interview({
    required this.id,
    required this.role,
    required this.date,
    required this.durationMinutes,
    required this.score,
    required this.status,
    required this.questions,
  });

  int get questionsAnswered => questions.length;

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  /// e.g. "Jun 28, 2026"
  String get formattedDate =>
      '${_months[date.month - 1]} ${date.day}, ${date.year}';
}
