
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silakehtm/app/modules/logout/views/logout_view.dart';

import 'package:get/get.dart';

import '../../my_dashboard/views/my_dashboard_view.dart';
import '../../my_profile/views/my_profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final Widget _myHome    = const MyDashboardView();
  final Widget _myProfile = MyProfileView();
  final Widget _myOut     = LogoutView();

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.account_circle, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          color: Colors.blue,
          buttonBackgroundColor: Colors.lightBlue,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          letIndexChange: (index) => true,
        ),
        body: Obx(()=> getBody()),
    );
  }

   Widget getBody()  {
    if(controller.currentIndex.value == 0){
      return _myProfile;
    }else if(controller.currentIndex.value == 1){
      return _myHome;
    }else{
      return _myOut;
    }

   }
}
