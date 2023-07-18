import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keluar_ranap/bindings/keluar_ranap_binding.dart';
import '../modules/keluar_ranap/permintaan_keluar_ranap/bindings/permintaan_keluar_ranap_binding.dart';
import '../modules/keluar_ranap/permintaan_keluar_ranap/views/permintaan_keluar_ranap_view.dart';
import '../modules/keluar_ranap/views/keluar_ranap_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/my_dashboard/bindings/my_dashboard_binding.dart';
import '../modules/my_dashboard/views/my_dashboard_view.dart';
import '../modules/my_profile/bindings/my_profile_binding.dart';
import '../modules/my_profile/views/my_profile_view.dart';
import '../modules/permintaan_ranap/bindings/permintaan_ranap_binding.dart';
import '../modules/permintaan_ranap/views/permintaan_ranap_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.KELUAR_RANAP,
      page: () => KeluarRanapView(
        selectedIndex: 0,
      ),
      binding: KeluarRanapBinding(),
      children: [
        GetPage(
          name: _Paths.PERMINTAAN_KELUAR_RANAP,
          page: () => PermintaanKeluarRanapView(),
          binding: PermintaanKeluarRanapBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_DASHBOARD,
      page: () => const MyDashboardView(),
      binding: MyDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PERMINTAAN_RANAP,
      page: () => const PermintaanRanapView(),
      binding: PermintaanRanapBinding(),
    ),
  ];
}
