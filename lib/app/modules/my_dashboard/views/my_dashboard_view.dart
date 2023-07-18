import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/my_dashboard_controller.dart';

class MyDashboardView extends GetView<MyDashboardController> {
  const MyDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height - 280;
    final box = GetStorage();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: const Color.fromRGBO(66,116,249,1.0),
        title: Text('RSUD Dr. Adnaan WD Kota Payakumbuh',
          style: TextStyle(
              fontSize: 15.sp),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/back.png",
                width: size.width
            ),
          ),
          Positioned(
            top: 15.h,
            height:heightScreen,
            width: widthScreen,
            child: Builder(
                builder: (context){
                  GridView? view;
                  switch(box.read('roles')){
                    case "Poli":
                      view = GridView.count(
                        padding: const EdgeInsets.all(15.0),
                        crossAxisCount: 2,
                        childAspectRatio: widthScreen/heightScreen,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          GestureDetector(
                            onTap:(){
                              Get.toNamed(Routes.PERMINTAAN_RANAP);
                            },
                            child: Container(
                              width: 10.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color.fromRGBO(66,116,249,1.0),
                                      width: 2
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/permintaan_ranap.png',
                                    width: 25.w,
                                    height: 15.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Permintaan Ranap', textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                      break;

                    case "Rawat Inap":
                      view = GridView.count(
                        padding: const EdgeInsets.all(15.0),
                        crossAxisCount: 2,
                        childAspectRatio: widthScreen/heightScreen,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          GestureDetector(
                            onTap:(){
                              Get.toNamed(Routes.KELUAR_RANAP);
                            },
                            child: Container(
                              width: 10.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color.fromRGBO(66,116,249,1.0),
                                      width: 2
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/keluar_ranap.png',
                                    width: 25.w,
                                    height: 15.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Keluar Ranap', textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: 10.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromRGBO(66,116,249,1.0),
                                    width: 2
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/pindah_bed.png',
                                  width: 25.w,
                                  height: 15.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Permintaan Pindah Bed', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 10.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromRGBO(66,116,249,1.0),
                                    width: 2
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/permintaan_ok.png',
                                    width: 15.w,
                                    height: 15.h,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Permintaan Operasi', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 10.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromRGBO(66,116,249,1.0),
                                    width: 2
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/jadwal_ok.png',
                                  width: 20.w,
                                  height: 15.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Jadwal Operasi', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 1.h,
                          )
                        ],
                      );
                      break;

                    case "Kepala Ruangan":
                      view = GridView.count(
                        padding: const EdgeInsets.all(15.0),
                        crossAxisCount: 2,
                        childAspectRatio: widthScreen/heightScreen,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            width: 10.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromRGBO(66,116,249,1.0),
                                    width: 2
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/permintaan_ok.png',
                                    width: 15.w,
                                    height: 15.h,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Permintaan Operasi', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 10.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromRGBO(66,116,249,1.0),
                                    width: 2
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/jadwal_ok.png',
                                  width: 20.w,
                                  height: 15.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Jadwal Operasi', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 1.h,
                          )
                        ],
                      );
                      break;
                  }
                  return Container(child: view);
                }
            ),
          ),
        ],
      ),
    );
  }
}
