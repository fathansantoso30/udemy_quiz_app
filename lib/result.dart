import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalscore;
  final VoidCallback resetHandler;
  const Result(
      {super.key, required this.finalscore, required this.resetHandler});

  String get resultPhrase {
    String resultText;
    if (finalscore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (finalscore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (finalscore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(children: [
            const Text('Final Score: '),
            Text(finalscore.toString())
          ]),
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: const Text(
              'Restart Quiz!',
            ),
          ),
        ],
      ),
    );
  }
}
