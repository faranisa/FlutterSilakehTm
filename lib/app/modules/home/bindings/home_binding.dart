import 'package:get/get.dart';

import '../../../../core/authentication_manager.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationManager());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
