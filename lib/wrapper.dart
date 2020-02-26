import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ks2020/screens/auth_wrapper.dart';
import 'package:ks2020/screens/events/events.dart';
import 'screens/proshows/proshows.dart';

class Wrapper extends StatelessWidget {
  final Widget child;

  const Wrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      routes: {
        '/': (_) => AuthWrapper(),
        '/exploreEvents': (_) => Events(),
        // '/exploreSponsor': (_) => Sponsor(),
        // '/exploreProshows': (_) => Proshows(),
      },
    );
  }
}
