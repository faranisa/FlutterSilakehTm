import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/authentication_manager.dart';
import '../../../../model/logoutModel/Logout_model.dart';
import '../../../data/silakehtm_provider.dart';

class LogoutController extends GetxController {
  //TODO: Implement LogoutController

  final count = 0.obs;

  late AuthenticationManager _authManager;

  SilakehtmProvider provider = Get.put(SilakehtmProvider());

  Future<LogoutModel?> logoutUser() async {

    final response = await provider.kel();

    if (response != null) {
      _authManager.logOut();
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Maaf Anda Gagal Keluar Dari Aplikasi',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
