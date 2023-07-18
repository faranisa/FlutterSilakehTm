
import 'package:flutter/material.dart';
import 'package:flutter_silakehtm/app/data/silakehtm_provider.dart';
import 'package:get/get.dart';


import '../../../../core/authentication_manager.dart';
import '../../../../model/loginModel/Login_model.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

   var isHidden = true.obs;

   late final AuthenticationManager _authManager;

   SilakehtmProvider provider = Get.put(SilakehtmProvider());

   Future<LoginModel?> loginUser(String email, String password) async {

     final response = await provider.fetchLogin(email, password);

     if (response != null) {
       /// Set isLogin to true

       for(var i =0; i < response.user.roles.length; i++){
         _authManager.login(response.token, response.user.name, response.detpoli.idpoli, response.user.uname, response.detpoli.poli, response.user.roles[i].name);
       }

     } else {
       /// Show user a dialog about the error response
       Get.defaultDialog(
           title: 'Username atau Password Salah',
           middleText: 'Maaf User Tidak Ditemukan',
           textConfirm: 'OK',
           confirmTextColor: Colors.white,
           onConfirm: () {
             Get.back();
           });

       // Get.snackbar(
       //   "Username atau Password Salah",
       //   "Maaf User Tidak Ditemukan",
       //   icon: const Icon(Icons.close, color: Colors.red),
       //   snackPosition: SnackPosition.BOTTOM,
       //   backgroundColor: Colors.white,
       // );
     }
     return response;
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
  void onClose(){}
}
