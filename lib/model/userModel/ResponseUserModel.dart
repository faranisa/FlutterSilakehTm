class ResponseUserModel {
  ResponseUserModel({
      required this.id,
      required this.createdAt,
      required this.name,
      required this.avatar,});

  ResponseUserModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
  }
  late String id;
  late String createdAt;
  late String name;
  late String avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['name'] = name;
    map['avatar'] = avatar;
    return map;
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '$id $name';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return createdAt.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(ResponseUserModel model) {
    return id == model.id;
  }

  @override
  String toString() => name;

}