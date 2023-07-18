class Detpoli {
  Detpoli({
      required this.loket,
      required this.subloket,
      required this.idpoli,
      required this.poli,
      required this.idsmf,
      required this.smf,});

  Detpoli.fromJson(dynamic json) {
    loket = json['loket'];
    subloket = json['subloket'];
    idpoli = json['idpoli'];
    poli = json['poli'];
    idsmf = json['idsmf'];
    smf = json['smf'];
  }

  late String loket;
  late String subloket;
  late int idpoli;
  late String poli;
  late String idsmf;
  late String smf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loket'] = loket;
    map['subloket'] = subloket;
    map['idpoli'] = idpoli;
    map['poli'] = poli;
    map['idsmf'] = idsmf;
    map['smf'] = smf;
    return map;
  }

}