import 'package:flutter/material.dart';
import 'package:flutter_silakehtm/model/ranapBelumPulangModel/Ranap_blm_plg_model.dart';
import 'package:get/get.dart';

import '../../../../../model/caraKeluarModel/ResponseCaraKeluar.dart';
import '../../../../data/silakehtm_provider.dart';

class PermintaanKeluarRanapController extends GetxController {
  //TODO: Implement PermintaanKeluarRanapController

  late RanapBlmPlgModel data;
  SilakehtmProvider provider = Get.put(SilakehtmProvider());

  Future<ResponseCaraKeluar?> caraKel(int idMaster, int statt) async {

    final responseCara = await provider.caraKeluar(idMaster, statt);

    if (responseCara != null) {
      for(var i =0; i < responseCara.data.length; i++){
        print(responseCara.data[i].deskripsi);
      }
      // return ResponseCaraKeluar.fromJson(responseCara);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Maaf Tidak Mendapatkan Data Cara Keluar',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    return responseCara;
  }

  // Future<List<ResponseCaraKeluar>?> caraKel(int idMaster, int statt) async {
  //
  //   final responseCara = await provider.caraKeluar(idMaster, statt);
  //   final data         = responseCara?.data;
  //
  //   if (data != null) {
  //     return responseCara.data.length;
  //   } else {
  //     /// Show user a dialog about the error response
  //     Get.defaultDialog(
  //         middleText: 'Maaf Tidak Mendapatkan Data Cara Keluar',
  //         textConfirm: 'OK',
  //         confirmTextColor: Colors.white,
  //         onConfirm: () {
  //           Get.back();
  //         });
  //   }
  //   return responseCara.;
  // }

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  userAsString() {}
}
