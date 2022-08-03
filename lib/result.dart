import 'package:flutter/material.dart';
import 'package:my_flutter_test/button.dart';

class Result extends StatelessWidget {

  final Function() clickHandler;

  const Result({
    Key? key,
    required this.clickHandler
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Your answers are great!'),
        Button(clickHandler: clickHandler, text: "Try quiz again!")
      ],
    );
  }
}
