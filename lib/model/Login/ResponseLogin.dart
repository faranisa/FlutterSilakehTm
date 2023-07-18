import 'User.dart';
import 'Detpoli.dart';

class ResponseLogin {
  ResponseLogin({
      required this.user,
      required this.detpoli,
      required this.token,});

  ResponseLogin.fromJson(dynamic json) {
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    detpoli = (json['detpoli'] != null ? Detpoli.fromJson(json['detpoli']) : null)!;
    token = json['token'];
  }

  late User user;
  late Detpoli detpoli;
  late String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user.toJson();
    map['detpoli'] = detpoli.toJson();
    map['token'] = token;
    return map;
  }

}