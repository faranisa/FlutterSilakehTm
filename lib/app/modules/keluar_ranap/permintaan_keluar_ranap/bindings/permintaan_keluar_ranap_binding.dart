import 'package:get/get.dart';

import '../controllers/permintaan_keluar_ranap_controller.dart';

class PermintaanKeluarRanapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermintaanKeluarRanapController>(
      () => PermintaanKeluarRanapController(),
    );
  }
}
