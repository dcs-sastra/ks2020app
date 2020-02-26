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

  subscribe(String topic) {
    _user.document(uid).updateData({
      'subs': FieldValue.arrayUnion([topic])
    });
  }

  unsubscribe(String topic) {
    _user.document(uid).updateData({
      'subs': FieldValue.arrayRemove([topic])
    });
  }

  Stream<UserModel> get user {
    return _user.document(uid).snapshots().map(
          (dss) => UserModel.fromJson(dss.data),
        );
  }
}
