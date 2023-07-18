import 'dart:developer';

import 'package:flutter_silakehtm/model/ranapBelumPulangModel/Ranap_blm_plg_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../data/silakehtm_provider.dart';

class KeluarRanapController extends GetxController {
  //TODO: Implement KeluarRanapController

  var box = GetStorage();
  var isLoading = true.obs;
  var ranapBlmPlgList = <RanapBlmPlgModel>[].obs;
  SilakehtmProvider provider = Get.put(SilakehtmProvider());
  var listRanBlPlg = [].obs;
  var listRanBlPlgModel = [].obs;

  @override
  void onInit() {
    super.onInit();
    // changeDate('1965-08-28');
    var idpol = box.read('idPoli');
    log('id pol $idpol');
    fetchPasienRanapBlmPlg(idpol);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void fetchPasienRanapBlmPlg(int idPol) async{
    try{
      isLoading(true);
      var pasBlmPlg = await provider.listRanBlmPlg(idPol);
      if(pasBlmPlg != null){
        ranapBlmPlgList.addAll(pasBlmPlg);
        listRanBlPlgModel.addAll(ranapBlmPlgList);
      }
    }finally{
      isLoading(false);
    }
  }

  void filterKeluarRanap(String query){
    if (query.isEmpty) {
      listRanBlPlg.value = ranapBlmPlgList;
    }
    var newList = <RanapBlmPlgModel>[];
    for (var element in ranapBlmPlgList) {
      if (element.contains(query)) {
        newList.add(element);
      }
    }
    listRanBlPlgModel.value = newList;
  }

  static String changeDate(String tgl){
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(tgl); // <-- dd/MM 24H format

    var outputFormat = DateFormat('dd MMM yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
