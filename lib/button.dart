import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() clickHandler;
  final String text;

  const Button({
    Key? key,
    required this.clickHandler,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text(text),
        onPressed: clickHandler,
      ),
    );
  }
}
