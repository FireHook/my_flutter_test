import 'package:flutter/material.dart';
import 'package:my_flutter_test/quiz.dart';
import 'package:my_flutter_test/result.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {

  var _questionIndex = 0;

  final _questions = const [
    {
      'questionsText': 'What\'s your favourite color?',
      'answers': ['Black', 'Read', 'Green']
    },
    {
      'questionsText': 'What\'s your favourite animal?',
      'answers': ['Dog', 'Cat', 'Rabbit']
    },
    {
      'questionsText': 'What\'s your favourite rest?',
      'answers': ['Sea', 'Mountains', 'Urban']
    }
  ];

  void _buttonClicked() {
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interesting Quiz App'),
        ),
        body: _questionIndex < _questions.length
          ? Quiz(questions: _questions, questionIndex: _questionIndex, clickHandler: _buttonClicked)
          : Result(clickHandler: _resetQuiz,),
      ),
    );
  }

}