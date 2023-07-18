import 'dart:developer';

import 'package:flutter_silakehtm/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../core/authentication_manager.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    log("initialiszed seinga");
    _authmanager.checkLoginStatus();
    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

  }

  @override
  void onInit() {
    super.onInit();
    initializeSettings().then((value) {
      if(_authmanager.isLogged.value){
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
