import 'package:get/get.dart';

import '../controllers/permintaan_ranap_controller.dart';

class PermintaanRanapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermintaanRanapController>(
      () => PermintaanRanapController(),
    );
  }
}
