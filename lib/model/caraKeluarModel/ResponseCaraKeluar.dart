import 'Data.dart';

class ResponseCaraKeluar {
  ResponseCaraKeluar({
      required this.status,
      required this.message,
      required this.data,});

  ResponseCaraKeluar.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }
  late bool status;
  late String message;
  late List<Data> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data.map((v) => v.toJson()).toList();
    return map;
  }

}