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

class MyPos {
  final double bottom, right, left;

  const MyPos({this.bottom = 0, this.right = 0, this.left = 0});
}

class _MenuState extends State<Menu> {
  static const Duration duration = const Duration(milliseconds: 200);
  static const left = const MyPos(
    bottom: 16,
    left: 54,
  );

  static const right = const MyPos(
    bottom: 16,
    right: 54,
  );

  MenuItem active = MenuItem.EVENTS;

  MyPos center;

  MyPos getPos(item) {
    switch (active) {
      case MenuItem.EVENTS:
        switch (item) {
          case MenuItem.EVENTS:
            return center;
          case MenuItem.PROSHOWS:
            return left;
          case MenuItem.SPONSORS:
            return right;
          default:
        }
        break;
      case MenuItem.PROSHOWS:
        switch (item) {
          case MenuItem.EVENTS:
            return right;
          case MenuItem.PROSHOWS:
            return center;
          case MenuItem.SPONSORS:
            return left;
          default:
        }
        break;
      case MenuItem.SPONSORS:
        switch (item) {
          case MenuItem.EVENTS:
            return left;
          case MenuItem.PROSHOWS:
            return right;
          case MenuItem.SPONSORS:
            return center;
          default:
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.animationController
        .animateToPage(getInd(), duration: duration, curve: Curves.easeInOut);

    center = MyPos(
      bottom: 96,
      left: (MediaQuery.of(context).size.width / 2) - 40,
    );

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
        AnimatedPositioned(
          duration: duration,
          right: getPos(MenuItem.PROSHOWS).right,
          bottom: getPos(MenuItem.PROSHOWS).bottom,
          left: getPos(MenuItem.PROSHOWS).left,
          child: GestureDetector(
            onTap: () {
              setState(() {
                active = MenuItem.PROSHOWS;
              });
            },
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
        AnimatedPositioned(
          duration: duration,
          left: getPos(MenuItem.SPONSORS).left,
          bottom: getPos(MenuItem.SPONSORS).bottom,
          right: getPos(MenuItem.SPONSORS).right,
          child: GestureDetector(
            onTap: () {
              setState(() {
                active = MenuItem.SPONSORS;
              });
            },
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
        AnimatedPositioned(
          duration: duration,
          bottom: getPos(MenuItem.EVENTS).bottom,
          right: getPos(MenuItem.EVENTS).right,
          left: getPos(MenuItem.EVENTS).left,
          child: GestureDetector(
            onTap: () {
              setState(() {
                active = MenuItem.EVENTS;
              });
            },
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
