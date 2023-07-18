import 'package:get/get.dart';

import '../controllers/my_dashboard_controller.dart';

class MyDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDashboardController>(
      () => MyDashboardController(),
    );
  }
}
