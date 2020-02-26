import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'widgets/menu.dart';
import 'package:ks2020/screens/home/widgets/vertical_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              buildAbout(),
              buildProfile(),
              buildKS(),
              Container(
                width: double.maxFinite,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    buildPlanetWithText('Proshows'),
                    buildPlanetWithText('Explore Events', path: 'Events'),
                    buildPlanetWithText('Sponsors'),
                  ].map(addArrow).toList(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Menu(_pageController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column addArrow(e) => Column(
        children: <Widget>[
          e,
          SizedBox(height: 16),
          Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
            size: 48,
          ),
        ],
      );

  Widget buildPlanetWithText(String text, {String path}) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/explore${text ?? path}'),
      child: Stack(
        children: <Widget>[
          buildCircText(text),
          buildPlanet(),
        ],
      ),
    );
  }

  Align buildPlanet() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 128),
        child: Image.asset(
          'assets/planet.png',
          fit: BoxFit.cover,
          height: 128,
          width: 128,
        ),
      ),
    );
  }

  Align buildCircText(String text) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 128),
        child: CircularText(
          radius: 64,
          position: CircularTextPosition.outside,
          children: [
            TextItem(
              text: Text(
                text.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              space: 12,
              startAngle: -90,
              startAngleAlignment: StartAngleAlignment.center,
              direction: CircularTextDirection.clockwise,
            ),
          ],
        ),
      ),
    );
  }

  Align buildKS() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 16),
          Image.asset(
            'assets/ks.png',
          ),
        ],
      ),
    );
  }

  Align buildProfile() {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/alien.png'),
          VerticalText(
            'PROFILE',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Align buildAbout() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: VerticalText(
              'ABOUT',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Image.asset('assets/ufo.png'),
        ],
      ),
    );
  }
}
