import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ks2020/services/auth/auth_service.dart';

class AuthChecker extends StatelessWidget {
  final Widget Function(bool signedIn) builder;
  const AuthChecker({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: AuthService().user,
      builder: (_, user) {
        return builder(user.data != null);
      },
    );
  }
}
