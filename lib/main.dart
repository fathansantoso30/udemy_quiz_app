import 'package:flutter/material.dart';
import 'package:udemy_quiz_app/answer.dart';
import 'package:udemy_quiz_app/question.dart';
import 'package:udemy_quiz_app/quiz.dart';
import 'package:udemy_quiz_app/result.dart';

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
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 30},
        {'text': 'White', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answer': [
        {'text': 'Ben', 'score': 10},
        {'text': 'Max', 'score': 20},
        {'text': 'John', 'score': 30},
        {'text': 'Liam', 'score': 40},
      ],
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex <= _questions.length) {
      print('We have more question');
    } else {
      print('No more questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                finalscore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
