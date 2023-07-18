
import 'package:flutter_silakehtm/core/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager{

  final isLogged = false.obs;

  void logOut(){
    isLogged.value = false;
    removeToken();
  }

  void login(String? token, String? nama, int? idPoli, String? username, String? nmPoli, String? role) async {
    isLogged.value = true;
    await saveToken(token);
    await saveDataLogin(nama, idPoli, username, nmPoli, role);
  }

  void checkLoginStatus() async{

    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

}