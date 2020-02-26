import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const VerticalText(this.text, {this.style});

  String vertical() {
    return text
        .toUpperCase()
        .split('')
        .map((e) => e + '\n')
        .toList()
        .join()
        .trimRight()
        .trimLeft();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      vertical(),
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
