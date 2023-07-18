import 'User.dart';
import 'Detpoli.dart';

class LoginModel {
  LoginModel({
      required this.user,
      required this.detpoli,
      required this.token,});

  LoginModel.fromJson(dynamic json) {
    if(json['user'] != null){
      user = User.fromJson(json['user']);
    }

    if(json['detpoli'] != null){
      detpoli = Detpoli.fromJson(json['detpoli']);
    }
    // user = json['user'] != null ? User.fromJson(json['user']) : null;
    // detpoli = json['detpoli'] != null ? Detpoli.fromJson(json['detpoli']) : null;
    token = json['token'];
  }

  late User user;
  late Detpoli detpoli;
  late String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final user = this.user;
    map['user'] = user.toJson();
    final detpoli = this.detpoli;
    map['detpoli'] = detpoli.toJson();
    map['token'] = token;
    return map;
  }

}