import 'package:flutter_cloud_music_lite/app/controller/app_settings_controller.dart';
import 'package:flutter_cloud_music_lite/pages/music/music_home_controller.dart';
import 'package:get/get.dart';

class MusicHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MusicHomeController>(MusicHomeController());
  }
}