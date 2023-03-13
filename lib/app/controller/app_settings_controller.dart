import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cloud_music_lite/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../services/local_storage_service.dart';
import '../log.dart';

class AppSettingsController extends GetxController {
  var language = 'en_US'.obs;
  static const zh = 'zh';
  static const en = 'en';
  static const Locale zhLocale = Locale(zh);
  static const Locale enLocale = Locale(en);
  Locale? locale;

  var themeMode = 0.obs;

  @override
  void onInit() {

    themeMode.value = LocalStorageService.instance.getValue(LocalStorageService.kTheme, 0);

    _getLanguage();

    super.onInit();
  }

  void changeTheme() {
    Get.dialog(SimpleDialog(
      title: Text(LocaleKeys.settings_theme.tr),
      children: [
        RadioListTile<int>(
          title: Text(LocaleKeys.settings_themes_system.tr),
          value: 0,
          groupValue: themeMode.value,
          onChanged: (e) {
            Get.back();
            setTheme(e ?? 0);
          },
        ),
        RadioListTile<int>(
          title: Text(LocaleKeys.settings_themes_light.tr),
          value: 1,
          groupValue: themeMode.value,
          onChanged: (e) {
            Get.back();
            setTheme(e ?? 0);
          },
        ),
        RadioListTile(
          title: Text(LocaleKeys.settings_themes_dark.tr),
          value: 2,
          groupValue: themeMode.value,
          onChanged: (e) {
            Get.back();
            setTheme(e ?? 0);
          },
        )
      ],
    ));
  }

  void _getLanguage() {
    var languageCode = LocalStorageService.instance
        .getValue(LocalStorageService.kLanguage, '');

    if (languageCode.isEmpty) {
      var deviceLocale = Get.deviceLocale;

      //无法获取到语言，默认设置为英文
      if (deviceLocale == null) {
        locale = enLocale;
        LocalStorageService.instance
            .setValue(LocalStorageService.kLanguage, en);
      } else {
        locale = deviceLocale;
      }
    } else {
      locale = Locale(languageCode);
    }
    language.value = locale!.languageCode;
  }

  void changeLanguage() {
    Get.dialog(SimpleDialog(
      title: Text(LocaleKeys.settings_language.tr),
      children: [
        RadioListTile(
          title: const Text('简体中文'),
          value: zh,
          groupValue: Get.locale?.languageCode ?? '',
          onChanged: (e) {
            Get.back();
            setLanguage(zhLocale);
          },
        ),
        RadioListTile(
          title: const Text('English'),
          value: en,
          groupValue: Get.locale?.languageCode ?? '',
          onChanged: (e) {
            Get.back();
            setLanguage(enLocale);
          },
        )
      ],
    ));
  }

  void setLanguage(Locale locale) {
    LocalStorageService.instance
        .setValue(LocalStorageService.kLanguage, locale.languageCode);
    Get.updateLocale(locale);
  }

  void setTheme(int value) {
    themeMode.value = value;
    var mode = ThemeMode.values[value];

    LocalStorageService.instance.setValue(LocalStorageService.kTheme, value);
    Get.changeThemeMode(mode);
  }
}
