
import 'Roles.dart';

class User {
  User({
      required this.id,
      required this.uname,
      required this.name,
      required this.email,
      required this.roles,});

  User.fromJson(dynamic json) {
    id = json['id'];
    uname = json['uname'];
    name = json['name'];
    email = json['email'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles.add(Roles.fromJson(v));
      });
    }
  }
  late int id;
  late String uname;
  late String name;
  late String email;
  late List<Roles> roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uname'] = uname;
    map['name'] = name;
    map['email'] = email;
    map['roles'] = roles.map((v) => v.toJson()).toList();
    return map;
  }

}