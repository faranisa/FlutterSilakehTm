import 'Pivot.dart';

class Roles {
  Roles({
      required this.id,
      required this.name,
      required this.guardName,
      required this.createdAt,
      required this.updatedAt,
      required this.pivot,});

  Roles.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = (json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null)!;
  }

  late int id;
  late String name;
  late String guardName;
  late String createdAt;
  late String updatedAt;
  late Pivot pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['guard_name'] = guardName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pivot != null) {
      map['pivot'] = pivot.toJson();
    }
    return map;
  }

}