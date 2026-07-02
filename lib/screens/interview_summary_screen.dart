import 'package:flutter/material.dart';
import '../models/interview.dart';

class InterviewSummaryScreen extends StatelessWidget {
  final Interview interview;

  const InterviewSummaryScreen({super.key, required this.interview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6FA),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: const Text(
          'Interview Summary',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: const BackButton(color: Colors.black87),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
          _OverviewCard(interview: interview),
          const SizedBox(height: 16),
          ...interview.questions.map(
            (q) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _QuestionCard(
                question: q,
                // First question starts expanded, like the mockup.
                initiallyExpanded: q.number == 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final Interview interview;

  const _OverviewCard({required this.interview});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _InfoTile(label: 'Role', value: interview.role),
              ),
              Expanded(
                child: _InfoTile(
                  label: 'Date',
                  value: interview.formattedDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _InfoTile(
                  label: 'Duration',
                  value: '${interview.durationMinutes} minutes',
                ),
              ),
              Expanded(
                child: _InfoTile(
                  label: 'Questions',
                  value: '${interview.questionsAnswered} answered',
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _InfoTile(
                  label: 'Final Score',
                  value: '${interview.score}/100',
                  valueColor: interview.status.color,
                ),
              ),
              Expanded(
                child: _InfoTile(
                  label: 'Status',
                  value: interview.status.label,
                  valueColor: interview.status.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoTile({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _QuestionCard extends StatefulWidget {
  final QuestionFeedback question;
  final bool initiallyExpanded;

  const _QuestionCard({
    required this.question,
    this.initiallyExpanded = false,
  });

  @override
  State<_QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<_QuestionCard> {
  late bool _expanded = widget.initiallyExpanded;

  Color get _scoreColor {
    final score = widget.question.score;
    if (score >= 85) return const Color(0xFF16A34A);
    if (score >= 70) return const Color(0xFF2563EB);
    return const Color(0xFFEA8C00);
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.question;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEAFE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Q${q.number}',
                      style: const TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      q.question,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${q.score}',
                    style: TextStyle(
                      color: _scoreColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState:
                _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Bubble(
                    label: 'Your Transcript',
                    text: q.transcript,
                    background: const Color(0xFFF1F3F6),
                    labelColor: Colors.grey.shade600,
                  ),
                  const SizedBox(height: 10),
                  _Bubble(
                    label: 'AI Feedback',
                    text: q.aiFeedback,
                    background: const Color(0xFFDCEAFE),
                    labelColor: const Color(0xFF2563EB),
                  ),
                ],
              ),
            ),
            secondChild: const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final String label;
  final String text;
  final Color background;
  final Color labelColor;

  const _Bubble({
    required this.label,
    required this.text,
    required this.background,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}
