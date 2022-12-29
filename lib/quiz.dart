import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(
      {super.key,
      required this.questions,
      required this.questionIndex,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'].toString(),
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                selectHandler: (() => answerQuestion(answer['score'] as int)),
                answerText: answer['text'] as String)),
      ],
    );
  }
}
