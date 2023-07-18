import 'dart:developer';

import 'package:get_storage/get_storage.dart';

mixin CacheManager {

  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write('token', token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read('token');
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove('token');
    await box.remove('namaUser');
    await box.remove('idPoli');
    await box.remove('username');
    await box.remove('nmPoli');
    log('ini token yg d delete ${box.remove('token')}');
  }

  Future<void> saveDataLogin(String? nama, int? idPoli, String? username, String? nmPoli, String? roles) async{
    final box = GetStorage();
    await box.write('namaUser', nama);
    await box.write('idPoli', idPoli);
    await box.write('username', username);
    await box.write('nmPoli', nmPoli);
    await box.write('roles', roles);
  }
}