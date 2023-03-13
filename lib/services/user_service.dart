import 'dart:io';

import 'package:flutter_cloud_music_lite/models/user/register_anonimous_model.dart';
import 'package:flutter_cloud_music_lite/services/local_storage_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  final LocalStorageService storageService = Get.find<LocalStorageService>();

  String token = '';
  Cookie? userCookie ;
  int userId = 0;
  bool logged = false;


  void setAuthInfo(RegisterAnonymousModel model){
    userCookie = Cookie.fromSetCookieValue(model.cookie);
    userId = model.userId;
    storageService.setValue(LocalStorageService.kCookie,model.cookie);
    storageService.setValue(LocalStorageService.kUserId, model.userId);
    logged = true;
  }

}
