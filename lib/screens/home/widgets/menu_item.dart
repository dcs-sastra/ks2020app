import 'package:flutter/material.dart';
import 'package:ks2020/screens/home/widgets/vertical_text.dart';

class MenuItem extends StatelessWidget {
  final double progress;
  final String text;
  final bool visible, active;

  const MenuItem({Key key, this.progress, this.text, this.visible, this.active})
      : super(key: key);

  static Widget planet = Image.asset('assets/planet3.png');

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: visible ? 1 : 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          VerticalText(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: active ? FontWeight.bold : null,
            ),
          ),
          SizedBox(height: 8),
          planet,
        ],
      ),
    );
  }
}
