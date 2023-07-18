class RanapBlmPlgModel {
  RanapBlmPlgModel({
      required this.idtrans,
      required this.idnts,
      required this.idregpasien,
      required this.idregranap,
      required this.idpoliasal,
      required this.poliasal,
      required this.norm,
      required this.nm,
      required this.tmlhr,
      required this.tglhr,
      required this.umur,
      required this.almt,
      required this.pngjwb,
      required this.rungn,
      required this.kls,
      required this.jnsBayar,});

  RanapBlmPlgModel.fromJson(dynamic json) {
    idtrans = json['idtrans'];
    idnts = json['idnts'];
    idregpasien = json['idregpasien'];
    idregranap = json['idregranap'];
    idpoliasal = json['idpoliasal'];
    poliasal = json['poliasal'];
    norm = json['norm'];
    nm = json['nm'];
    tmlhr = json['tmlhr'];
    tglhr = json['tglhr'];
    umur = json['umur'];
    almt = json['almt'];
    pngjwb = json['pngjwb'];
    rungn = json['rungn'];
    kls = json['kls'];
    jnsBayar = json['jnsBayar'];
  }
  late int idtrans;
  late String idnts;
  late int idregpasien;
  late int idregranap;
  late int idpoliasal;
  late String poliasal;
  late int norm;
  late String nm;
  late String tmlhr;
  late String tglhr;
  late String umur;
  late String almt;
  late String pngjwb;
  late String rungn;
  late String kls;
  late String jnsBayar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idtrans'] = idtrans;
    map['idnts'] = idnts;
    map['idregpasien'] = idregpasien;
    map['idregranap'] = idregranap;
    map['idpoliasal'] = idpoliasal;
    map['poliasal'] = poliasal;
    map['norm'] = norm;
    map['nm'] = nm;
    map['tmlhr'] = tmlhr;
    map['tglhr'] = tglhr;
    map['umur'] = umur;
    map['almt'] = almt;
    map['pngjwb'] = pngjwb;
    map['rungn'] = rungn;
    map['kls'] = kls;
    map['jnsBayar'] = jnsBayar;
    return map;
  }

  bool contains(String query) {
    if (query.contains(" ")) {
      var queries = query.split(" ");
      print(queries);
      var isContain = false;
      for (var element in queries) {
        isContain = contains(element);
        if(!isContain){
          break;
        }
      }
      return isContain;
    }
    return "$nm, $norm, $pngjwb"
        .toLowerCase()
        .contains(query.toLowerCase());
  }
}