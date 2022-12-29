import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  const Question({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      child: Text(
        questionText,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
