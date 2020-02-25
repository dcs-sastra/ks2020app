import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String uid;
  UserModel(this.uid);
  String name, college;
  List<String> entries;

  UserModel.fromJson(Map<String, dynamic> userJson) {
    uid = userJson['uid'];
    name = userJson['name'] ?? '';
    college = userJson['college'] ?? '';
    entries = userJson['entries'] ?? [];
  }
}
