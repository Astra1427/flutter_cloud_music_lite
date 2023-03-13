import 'dart:convert';

import 'package:flutter_cloud_music_lite/app/log.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalStorageService extends GetxService{

  static LocalStorageService get instance => Get.find<LocalStorageService>();

  /// 语言
  /// * [zh] 简体中文
  /// * [en] 英文
  static const String kLanguage = "Language";

  /// 主题
  /// * [0] 浅色
  /// * [1] 深色
  static const String kTheme = 'ThemeMode';

  /// 用户身份验证用的Cookie
  static const String kCookie = 'UserAuthCookie';

  /// 用户Id
  static const String kUserId = 'UserId';

  late Box settingsBox;

  Future init()async{
    settingsBox = await Hive.openBox(
      'LocalStorage',
      encryptionCipher: HiveAesCipher(
        utf8.encode(r'ASMCd6hy$n!!@DrU6tc^7@hEBLLWHr0r')
      ),
    );
  }

  T getValue<T>(dynamic key,T defaultValue){
    var value = settingsBox.get(key,defaultValue: defaultValue);
    Log.d('Get LocalStorage:$key\r\n$value');
    return value;
  }

  Future setValue<T>(dynamic key,T value)async{
    Log.d('Set LocalStorage:$key\r\n$value');
    return settingsBox.put(key, value);
  }

  Future removeValue<T>(dynamic key)async{
    Log.d('Remove LocalStorage:$key');
    return await settingsBox.delete(key);
  }
}