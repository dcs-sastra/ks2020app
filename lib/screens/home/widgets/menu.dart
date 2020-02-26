import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ks2020/screens/home/widgets/vertical_text.dart';
import 'package:vector_math/vector_math.dart' show radians;

import 'half_circle.dart';

class Menu extends StatefulWidget {
  PageController pageController;
  Menu(this.pageController);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> menuItems = ['PROSHOWS', 'EVENTS', 'SPONSORS'];
  PageController pageController;
  List<double> size = [0, 1, 0];
  static const double radius = 112;

  @override
  void initState() {
    pageController = widget.pageController
      ..addListener(() {
        double temp = pageController.page;
        if (temp <= 1.0) {
          size[0] = 1 - temp;
          size[1] = temp;
          size[2] = 0;
        } else {
          size[0] = 0;
          size[1] = (temp - 2).abs();
          size[2] = 1 - (temp - 2).abs();
        }
        setState(() {
          size = size;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: HalfCircle(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset('assets/planet2.png'),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: List.generate(
              3,
              (i) => Flexible(
                flex: 1,
                child: Container(
                  height: 325,
                  child: InkWell(
                    onTap: () {
                      pageController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: List.generate(3, (i) {
              final double rad = radians((i * 60).toDouble() + 210);
              double k = size[i];
              print('Painting $i');
              return Transform(
                transform: Matrix4.identity()
                  ..translate(radius * cos(rad), radius * sin(rad)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    VerticalText(
                      menuItems[i],
                      style: TextStyle(
                        fontSize: lerpDouble(18, 20, k),
                        color: Colors.white,
                        fontWeight: FontWeight.lerp(
                          FontWeight.normal,
                          FontWeight.bold,
                          k,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: lerpDouble(64, 80, k),
                      width: lerpDouble(64, 80, k),
                      child: Image.asset(
                        'assets/planet3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
