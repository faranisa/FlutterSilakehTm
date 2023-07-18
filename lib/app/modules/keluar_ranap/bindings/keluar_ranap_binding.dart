import 'package:get/get.dart';

import '../controllers/keluar_ranap_controller.dart';

class KeluarRanapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeluarRanapController>(
      () => KeluarRanapController(),
    );
  }
}
