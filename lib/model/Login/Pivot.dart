class Pivot {
  Pivot({
      required this.modelId,
      required this.roleId,
      required this.modelType,});

  Pivot.fromJson(dynamic json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }
  late int modelId;
  late int roleId;
  late String modelType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model_id'] = modelId;
    map['role_id'] = roleId;
    map['model_type'] = modelType;
    return map;
  }

}