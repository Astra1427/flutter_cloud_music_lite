import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cloud_music_lite/app/controller/app_settings_controller.dart';
import 'package:flutter_cloud_music_lite/models/music/music_search_result_model.dart';
import 'package:flutter_cloud_music_lite/models/music/music_song_model.dart';
import 'package:get/get.dart';

import '../../network/RequestClient.dart';
import '../../network/music_request.dart';
import '../../services/audio_service.dart';

class MusicHomeController extends GetxController {
  final AppSettingsController settingsController =
      Get.find<AppSettingsController>();
  final AudioService audioService = Get.find<AudioService>();
  final MusicRequest musicRequest = MusicRequest();
  var lists = <MusicSongModel>[].obs;
  var playingId = 0.obs;


  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    refreshMusic();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changeLanguage() {
    settingsController.changeLanguage();
  }

  void changeTheme() {
    settingsController.changeTheme();
  }

  void refreshMusic() async {
    var result = await musicRequest.search('青花瓷');
    lists.clear();
    lists.value = result.result.songs;
  }

  void playAudio(MusicSongModel model) async {
    if (model.id == playingId.value) {
      playingId.value = audioService.switchPlayPause() ? audioService.currentPlaySong.value?.id ?? 0 : 0;
      update();
      return;
    }

    var result = await musicRequest.getMusicUrlsByIds([model.id]);
    playingId.value = await audioService.setPlaySong(result.data.first);
    update();
  }
}
