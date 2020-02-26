import 'package:flutter/material.dart';
import 'package:ks2020/screens/home/widgets/vertical_text.dart';
import 'half_circle.dart';

class Menu extends StatefulWidget {
  PageController animationController;
  Menu(this.animationController);

  @override
  _MenuState createState() => _MenuState();
}

enum MenuItem { EVENTS, SPONSORS, PROSHOWS }

class _MenuState extends State<Menu> {
  static const Duration duration = const Duration(milliseconds: 200);
  MenuItem active = MenuItem.EVENTS;

  @override
  Widget build(BuildContext context) {
    widget.animationController
        .animateToPage(getInd(), duration: duration, curve: Curves.easeInOut);

    return Container(
      height: 256,
      width: MediaQuery.of(context).size.width,
      child: Stack(
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
          Positioned(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  VerticalText(
                    'PROSHOWS',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Image.asset('assets/planet3.png'),
                ],
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  VerticalText(
                    'SPONSORS',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Image.asset('assets/planet3.png'),
                ],
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  VerticalText(
                    'EVENTS',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    // height: 80,
                    // width: 80,
                    child: Image.asset(
                      'assets/planet3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int getInd() {
    switch (active) {
      case MenuItem.EVENTS:
        return 1;
      case MenuItem.PROSHOWS:
        return 2;
      case MenuItem.SPONSORS:
        return 0;
      default:
    }
  }
}
