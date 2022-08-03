import 'package:flutter/material.dart';

import 'package:my_flutter_test/button.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function() clickHandler;

  const Quiz({
    Key? key,
    required this.questions,
    required this.questionIndex,
    required this.clickHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(questions[questionIndex]['questionsText'] as String),
      ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
        return Button(clickHandler: clickHandler, text: answer);
      }).toList()
    ]);
  }
}
