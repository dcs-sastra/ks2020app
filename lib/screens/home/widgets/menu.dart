import 'package:flutter/material.dart';
import 'circular_menu.dart';
import 'half_circle.dart';

class Menu extends StatefulWidget {
  PageController animationController;
  Menu(this.animationController);

  @override
  _MenuState createState() => _MenuState();
}

enum MenuItem { EVENTS, SPONSORS, PROSHOWS }

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const Duration duration = const Duration(milliseconds: 200);
  MenuItem active = MenuItem.EVENTS;

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0, end: 1.0472).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
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
        GestureDetector(
          onTap: () {
            animationController.forward();
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/planet2.png'),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RadialAnimation(0.1 * 360),
        )
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: AnimatedBuilder(
        //     animation: animation,
        //     builder: (bc, child) {
        //       return Transform(
        //         child: Container(
        //           // color: Colors.white,
        //           padding: EdgeInsets.fromLTRB(64, 0, 64, 32),
        //           height: 272,
        //           width: MediaQuery.of(context).size.width,
        //           child: Stack(
        //             children: <Widget>[
        //               Align(
        //                 alignment: Alignment.topRight,
        //                 child: GestureDetector(
        //                   onTap: () {},
        //                   child: Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: <Widget>[
        //                       VerticalText(
        //                         'PROSHOWS',
        //                         style: TextStyle(
        //                           fontSize: 18,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                       SizedBox(height: 8),
        //                       Image.asset('assets/planet3.png'),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Align(
        //                 alignment: Alignment.topLeft,
        //                 child: GestureDetector(
        //                   onTap: () {},
        //                   child: Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: <Widget>[
        //                       VerticalText(
        //                         'SPONSORS',
        //                         style: TextStyle(
        //                           fontSize: 18,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                       SizedBox(height: 8),
        //                       Image.asset('assets/planet3.png'),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Align(
        //                 alignment: Alignment.topCenter,
        //                 child: GestureDetector(
        //                   onTap: () {},
        //                   child: Column(
        //                     children: <Widget>[
        //                       VerticalText(
        //                         'EVENTS',
        //                         style: TextStyle(
        //                           fontSize: 18,
        //                           // fontWeight: FontWeight.bold,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                       SizedBox(height: 8),
        //                       Container(
        //                         // height: 80,
        //                         // width: 80,
        //                         child: Image.asset(
        //                           'assets/planet3.png',
        //                           fit: BoxFit.cover,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         alignment: FractionalOffset.bottomCenter,
        //         transform: new Matrix4.rotationZ(animation.value),
        //       );
        //     },
        //     child: Container(),
        //   ),
        // )
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
