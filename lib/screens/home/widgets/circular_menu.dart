import 'dart:math';

import 'package:flutter/material.dart';
import 'menu_item.dart';

import 'package:vector_math/vector_math.dart' show radians;

class RadialAnimation extends StatelessWidget {
  final double progress;
  RadialAnimation(this.progress);

  build(context) {
    return Stack(
      alignment: Alignment.center,
      children: List.generate(
        6,
        (index) => _buildButton(
          ((progress - (index * 60) - 30).round() % 360).toDouble(),
        ),
      ),
    );
  }

  static const radius = 112;

  _buildButton(double angle, {child}) {
    final double rad = radians(angle);
    bool k = (angle <= 330 && angle >= 210) ? true : false;
    bool q = (angle <= 280 && angle >= 260) ? true : false;
    return Transform(
      transform: Matrix4.identity()
        ..translate(radius * cos(rad), radius * sin(rad)),
      child: MenuItem(
        active: q,
        progress: progress,
        text: 'Events',
        visible: true,
      ),
    );
  }
}
