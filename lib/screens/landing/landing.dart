import 'package:flutter/material.dart';
import 'package:ks2020/services/auth/auth_service.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Sign In'),
              onPressed: AuthService().signIn,
            ),
            FlatButton(
              onPressed: AuthService().anonymousSignIn,
              child: Text('Enter as guest'),
            )
          ],
        ),
      ),
    );
  }
}
