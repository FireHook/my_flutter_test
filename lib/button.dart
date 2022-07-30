import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Function() clickHandler;

  const Button({
    Key? key,
    required this.clickHandler
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ElevatedButton(
          child: Text('test'),
          onPressed: () {
            clickHandler();
          },
      ),
    );
  }

}
