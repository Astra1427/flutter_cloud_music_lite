import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cloud_music_lite/app/controller/app_settings_controller.dart';
import 'package:flutter_cloud_music_lite/app/log.dart';
import 'package:flutter_cloud_music_lite/generated/locales.g.dart';
import 'package:flutter_cloud_music_lite/routes/app_pages.dart';
import 'package:flutter_cloud_music_lite/routes/route_path.dart';
import 'package:flutter_cloud_music_lite/services/audio_service.dart';
import 'package:flutter_cloud_music_lite/services/local_storage_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initServices();


  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stack) {
    //全局异常
    log(error.toString(),stackTrace: stack);
  });
}

Future initServices()async{
  //本地存储
  Log.d('Init LocalStorage Service');

  await Get.put(LocalStorageService()).init();

  Get.put(AudioService());

  //初始化设置控制器
  Get.put(AppSettingsController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: LocaleKeys.app_name.tr,

      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: ThemeMode.values[Get.find<AppSettingsController>().themeMode.value],
      translationsKeys: AppTranslation.translations,
      locale: Get.find<AppSettingsController>().locale,
      fallbackLocale: AppSettingsController.zhLocale,
      getPages: AppPages.pages,
      initialRoute: RoutePath.kMusicHome,

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        AppSettingsController.zhLocale,
        AppSettingsController.enLocale
      ],
      builder: (context,child){
        return EasyLoading.init()(context,child);

      },
    );
  }
}


