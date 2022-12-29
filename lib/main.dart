import 'package:flutter/material.dart';
import 'package:udemy_quiz_app/answer.dart';
import 'package:udemy_quiz_app/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'What\'s your favorite instructor?',
        'answer': ['Ben', 'Max', 'John', 'Liam'],
      }
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Question(
              questionText:
                  questions[_questionIndex]['questionText'].toString(),
            ),
            ...(questions[_questionIndex]['answer'] as List<String>).map(
                (answer) =>
                    Answer(selectHandler: _answerQuestion, answerText: answer)),
          ],
        ),
      ),
    );
  }
}
