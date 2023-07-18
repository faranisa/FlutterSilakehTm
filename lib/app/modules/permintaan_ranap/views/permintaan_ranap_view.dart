import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permintaan_ranap_controller.dart';

class PermintaanRanapView extends GetView<PermintaanRanapController> {
  const PermintaanRanapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermintaanRanapView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PermintaanRanapView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
