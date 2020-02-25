import 'package:flutter/material.dart';
import 'package:ks2020/screens/landing/landing.dart';
import 'package:ks2020/services/auth/auth_service.dart';
import 'package:ks2020/widgets/auth_checker.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthChecker(
      builder: (signedIn) {
        if (signedIn) {
          return Scaffold(
            body: Center(
              child: RaisedButton(
                onPressed: AuthService().logout,
                child: Text('Logout'),
              ),
            ),
          );
        } else {
          return Landing();
        }
      },
    );
  }
}
