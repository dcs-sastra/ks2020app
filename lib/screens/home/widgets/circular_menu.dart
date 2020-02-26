import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ks2020/screens/home/widgets/vertical_text.dart';
import 'menu_item_enum.dart';

import 'package:vector_math/vector_math.dart' show radians;

class CircularMenu extends StatelessWidget {
  final double angle;
  final String text;
  final MenuItemEnum menuItem;

  CircularMenu({this.angle, this.text, this.menuItem});

  static const radius = 112;
  @override
  Widget build(BuildContext context) {
    print('#######');
    print('Progress : $menuItem');
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(radius * cos(rad), radius * sin(rad)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            VerticalText(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              // height: lerpDouble(64, 80, progress),
              child: Image.asset('assets/planet3.png'),
            ),
          ],
        ));
  }
}
