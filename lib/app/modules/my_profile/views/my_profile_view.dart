import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  MyProfileView({Key? key}) : super(key: key);

  final boxDataLogin = GetStorage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                  "assets/top1.png",
                  width: size.width
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                  "assets/top2.png",
                  width: size.width
              ),
            ),
            Positioned(
              top: 8.h,
              right: 20.h,
              left: 3.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(66,116,249,1.0)
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    '${boxDataLogin.read('namaUser')}',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color.fromARGB(255, 41,96,255)
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    '${boxDataLogin.read('nmPoli')}',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color.fromARGB(255, 41,96,255)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
