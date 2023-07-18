import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../controllers/permintaan_keluar_ranap_controller.dart';

class PermintaanKeluarRanapView extends GetView<PermintaanKeluarRanapController> {
   PermintaanKeluarRanapView({Key? key}) : super(key: key);

   final GlobalKey<FormState> formKey = GlobalKey();
   final ruanController = TextEditingController();
   final tgLKelController = TextEditingController();
   final statusController = TextEditingController();
   final catController = TextEditingController();

   DateTime selectedDate = DateTime.now();
   TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Permintaan Keluar Ranap', style: TextStyle(fontSize: 12.sp),),
        // centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 2.h,),
          ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: const Image(image: NetworkImage('https://www.makintau.com/wp-content/uploads/2020/02/vanda-margraf-image.png'))),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text('+62-455-989-0987'),
                Text('a')
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Apakah besok ada tugas?'),
                Text('dfs')
              ],
            ),
          ),
          SizedBox(height: 4.h,),
          Container(
            margin: const EdgeInsets.all(5.0),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff3c8cbc), width: 1,),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: ruanController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ruangan Pasien',
                      ),
                    )
                ),

                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: tgLKelController,
                      onTap: () async{
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: selectedDate.subtract(const Duration(days: 30)),
                            lastDate: DateTime(selectedDate.year + 1));

                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: selectedTime,
                          context: context,
                        );

                        if (pickedDate != null && pickedTime != null) {
                          String formattedDate  = DateFormat('dd-MM-yyyy').format(pickedDate);
                          DateTime parsedTime   = DateFormat.jm().parse(pickedTime.format(context).toString());
                          String formattedTime  = DateFormat('HH:mm:ss').format(parsedTime);
                          tgLKelController.text = "$formattedDate $formattedTime";
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tanggal Keluar',
                      ),
                    )
                ),

                Container(
                    margin: const EdgeInsets.all(10),
                    child:
                    // DropdownSearch<ResponseCaraKeluar>(
                    //   popupProps: const PopupProps.bottomSheet(),
                    //   asyncItems: (int filter, int f) => controller.caraKel(filter, f),
                    //   itemAsString: (ResponseCaraKeluar u) => controller.userAsString(),
                    //   onChanged: (ResponseCaraKeluar? data) => print(data),
                    // ),

                    DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["Brazil", "Italia", "Tunisia", 'Canada'],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Status Keluar",
                          hintText: "Pilih Status Keluar",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                      onChanged: print,
                      selectedItem: "Brazil",
                      clearButtonProps: const ClearButtonProps(isVisible: true),
                    ),
                ),

                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: catController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Catatan Keluar Ranap',
                      ),
                    )
                ),

              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffF18265),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Simpan Data",
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    width: 200,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20)
                      ),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Kembali",
                        style: TextStyle(
                          color: Color(0xff070707),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                ],
              )
          ),
        ],
      ),
    );
  }
}
