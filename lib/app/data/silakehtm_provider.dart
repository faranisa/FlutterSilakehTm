import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_silakehtm/model/logoutModel/Logout_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/caraKeluarModel/ResponseCaraKeluar.dart';
import '../../model/loginModel/Login_model.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../model/ranapBelumPulangModel/Ranap_blm_plg_model.dart';

class SilakehtmProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://dev-simrs.payakumbuhkota.go.id/api/';
  }

  Future<LoginModel?> fetchLogin(String username, String password) async {

      final form = FormData({
        'username' : username,
        'password' : password
      });

      final response = await post("login", form);
      log("response Login dsni ${response.body}");
      var loginModel = LoginModel.fromJson(response.body);

      if (response.statusCode == HttpStatus.ok) {
        return loginModel;
      } else {
        Get.defaultDialog(
            title: 'Username atau Password Salah',
            middleText: 'Maaf User Tidak Ditemukan',
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
        return loginModel;
      }
  }

  Future<LogoutModel?> kel() async {

    final box = GetStorage();

    final response = await get("logout", headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('token')}'
    });

    var logoutModel = LogoutModel.fromJson(response.body);
    log("response Logout ${response.body}");

    if (response.statusCode == HttpStatus.ok) {
      return logoutModel;
    } else {
      return null;
    }
  }

  Future<List<RanapBlmPlgModel>?> listRanBlmPlg(int idPol) async{

    final box = GetStorage();

    final form = FormData({
      'idpoli' : idPol,
    });
    final responseListRanap = await post("master/trans-ranap", form, headers: {
    'Authorization': 'Bearer ${box.read('token')}',
    });

    var jsonRanap = responseListRanap.body as List;

    if (responseListRanap.statusCode == HttpStatus.ok) {
      var test = jsonRanap.map((e) => RanapBlmPlgModel.fromJson(e)).toList();
      log('ini tesaat $test');
      return test;
    } else {
      return null;
    }
  }

  Future<ResponseCaraKeluar?> caraKeluar(int idMas, int stat) async{

    final box = GetStorage();

    final form = FormData({
      'idmaster' : idMas,
      'stat'     : stat,
    });
    final responseListCaraKel = await post("master/referensi-detail", form, headers: {
      'Authorization': 'Bearer ${box.read('token')}',
    });

    var jsonCara = ResponseCaraKeluar.fromJson(responseListCaraKel.body);

    if (responseListCaraKel.statusCode == HttpStatus.ok) {
      log('ini jsonCara $jsonCara');
      return jsonCara;
    } else {
      return null;
    }
  }
}
