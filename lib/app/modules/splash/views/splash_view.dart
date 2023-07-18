import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
   const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return waitingView();
  }

   Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
     return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
   }

   Scaffold waitingView() {
     return Scaffold(
         body: Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 "assets/logo.png",
                 width: 50.w,
                 height: 25.h,
                 fit: BoxFit.contain,
               ),
               SizedBox(
                 height: 2.h,
               ),
               Text(
                 "SILAKEH TENAGA MEDIS", textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Colors.blueAccent,
                   fontWeight: FontWeight.bold,
                   fontSize: 25.sp,
                 ),
               ),
             ],
           ),
         ));
   }
}
