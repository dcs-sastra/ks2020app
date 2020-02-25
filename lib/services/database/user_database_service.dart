import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ks2020/models/user_model.dart';

class UserDatabaseService {
  CollectionReference _user = Firestore.instance.collection('user');
  final String uid;

  UserDatabaseService({this.uid});

  createNewUser(FirebaseUser firebaseUser) {
    _user.document(firebaseUser.uid).setData({
      'uid': firebaseUser.uid,
      'name': firebaseUser.displayName,
      'isAnonymouse': firebaseUser.isAnonymous,
    });
  }

  Future<UserModel> get user async {
    return UserModel.fromJson((await _user.document(uid).get()).data);
  }
}
