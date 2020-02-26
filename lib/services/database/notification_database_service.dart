import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ks2020/services/auth/auth_service.dart';
import 'package:ks2020/services/database/user_database_service.dart';

class NotificationService {
  CollectionReference _noti = Firestore.instance.collection('noti');
  subscribe(String topic) async {
    String uid = (await AuthService().currUser).uid;
    _noti.document(topic).updateData({
      'subUsers': FieldValue.arrayUnion([uid])
    });
    await UserDatabaseService(uid: uid).subscribe(topic.trim());
  }
}
