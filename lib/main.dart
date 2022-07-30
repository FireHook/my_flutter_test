import 'package:flutter/material.dart';
import 'package:my_flutter_test/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void _buttonClicked() {

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My test app'),
        ),
        body: Column(
          children: [
            Button(clickHandler: _buttonClicked)
          ],
        ),
      ),
    );
  }
}