class Data {
  Data({
      required this.id,
      required this.idMRef,
      required this.deskripsi,
      required this.statusAktif,
      this.userCreate, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    idMRef = json['id_m_ref'];
    deskripsi = json['deskripsi'];
    statusAktif = json['status_aktif'];
    userCreate = json['user_create'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  late int id;
  late int idMRef;
  late String deskripsi;
  late String statusAktif;
  dynamic userCreate;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['id_m_ref'] = idMRef;
    map['deskripsi'] = deskripsi;
    map['status_aktif'] = statusAktif;
    map['user_create'] = userCreate;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}