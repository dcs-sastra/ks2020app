import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ks2020/screens/home/widgets/vertical_text.dart';

class MenuItem extends StatelessWidget {
  final double progress;
  final String text;

  const MenuItem({Key key, this.progress, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        VerticalText(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.lerp(
              FontWeight.normal,
              FontWeight.bold,
              progress,
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: lerpDouble(64, 80, progress),
          child: Image.asset('assets/planet3.png'),
        ),
      ],
    );
  }
}
