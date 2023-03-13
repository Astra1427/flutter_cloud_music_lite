import 'package:flutter_cloud_music_lite/app/controller/app_settings_controller.dart';
import 'package:flutter_cloud_music_lite/pages/music/music_home_binding.dart';
import 'package:flutter_cloud_music_lite/pages/music/music_home_controller.dart';
import 'package:flutter_cloud_music_lite/pages/music/music_home_page.dart';
import 'package:flutter_cloud_music_lite/routes/route_path.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    //音乐首页
    GetPage(
        name: RoutePath.kMusicHome,
        page: () => const MusicHomePage(),
        binding: MusicHomeBinding()
        /*bindings: [
          BindingsBuilder.put(() => AppSettingsController()),
          BindingsBuilder.put(() => MusicHomeController())
        ]*/)
  ];
}
