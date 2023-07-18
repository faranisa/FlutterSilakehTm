
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/logout_controller.dart';

class LogoutView extends GetView<LogoutController> {
   LogoutView({Key? key}) : super(key: key);

  LogoutController logout = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar,
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 66,116,249),
                        Color.fromARGB(255, 41,96,255)
                      ]
                  )
              ),
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: const Icon(Icons.vpn_key),
                  title: const Text('Ganti Password',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: (){
                    Get.offNamed(Routes.HOME);
                  },
                  trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
              ),
            ),
          ),
          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 66,116,249),
                        Color.fromARGB(255, 41,96,255)
                      ]
                  )
              ),
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: const Icon(Icons.logout),
                  title: const Text('Keluar',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: (){
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.INFO,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Konfirmasi',
                        desc: 'Apakah Anda Yakin Ingin Keluar Dari Aplikasi?',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () async{
                          controller.logoutUser().then((value) => Get.offAllNamed(Routes.LOGIN));
                        },
                        btnOkText: 'Ya',
                        btnCancelText: 'Tidak'
                    ).show();
                  },
                  trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final topAppBar = AppBar(
  elevation: 0.1,
  backgroundColor: const Color.fromRGBO(66,116,249,1.0),
  title: const Text('RSUD Dr. Adnaan WD Kota Payakumbuh',
    style: TextStyle(
        fontSize: 20
    ),),
);
