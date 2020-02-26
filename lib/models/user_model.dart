class UserModel {
  String uid;
  UserModel(this.uid);
  String name, college;
  List<String> entries;
  List<dynamic> subs;

  UserModel.fromJson(Map<String, dynamic> userJson) {
    uid = userJson['uid'];
    name = userJson['name'] ?? '';
    college = userJson['college'] ?? '';
    entries = userJson['entries'] ?? [];
    subs = userJson['subs'] ?? [];
  }
}
