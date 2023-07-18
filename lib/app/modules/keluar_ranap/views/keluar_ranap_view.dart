import 'package:flutter/material.dart';
import 'package:flutter_silakehtm/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/keluar_ranap_controller.dart';

class KeluarRanapView extends GetView<KeluarRanapController> {
   KeluarRanapView({Key? key, required this.selectedIndex}) : super(key: key);

   int selectedIndex;
   String tgl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Pasien', style: TextStyle(fontSize: 12.sp),),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 10.h,
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 79, 156, 252),
                        Color.fromARGB(255, 180, 197, 246)
                      ]
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value){
                    controller.filterKeluarRanap(value);
                    // print("search: $value");
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Ketikan Nama Pasien',
                    labelText: 'Cari Pasien',
                  ),
                ),
              )
            ),
          ),
          SizedBox(height: 1.h,),
          Expanded(
              child: Obx((){

                print("search: ${controller.ranapBlmPlgList.length}");

                if(controller.isLoading.value){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(controller.listRanBlPlgModel.isEmpty){
                  return const Center(child: Text('data kosong'),);
                }else {
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 1.h);
                      },
                      itemCount: controller.listRanBlPlgModel.length,
                      itemBuilder: (context, index)=> InkWell(
                        onTap: (){
                          Get.toNamed(Routes.PERMINTAAN_KELUAR_RANAP, arguments:
                            controller.listRanBlPlgModel[index]
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.2,
                          margin: const EdgeInsets.only(top: 2, bottom: 2),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30)
                            ),
                            color: selectedIndex == index  ? const Color(0xff3c8cbc) : const Color(0xff82c3f2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(controller.listRanBlPlgModel[index].nm, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
                                ),
                                SizedBox(height: 1.h,),
                                Expanded(
                                  child: Text('${controller.listRanBlPlgModel[index].tmlhr} ${','} ${KeluarRanapController.changeDate(controller.ranapBlmPlgList[index].tglhr)}', style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                                ),

                                Expanded(
                                  child: Text(controller.listRanBlPlgModel[index].almt, style: TextStyle(color: Colors.white, fontSize: 10.sp),),
                                ),

                                Expanded(
                                  child: Text(controller.listRanBlPlgModel[index].pngjwb, style: TextStyle(color: Colors.white, fontSize: 8.sp),),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  );
                }
              })
          ),
        ],
      ),
    );
  }
}
