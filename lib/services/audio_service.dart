import 'package:flutter_cloud_music_lite/models/music/music_song_model.dart';
import 'package:flutter_cloud_music_lite/models/music/song_urls_model.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../app/log.dart';

class AudioService extends GetxService{

  static AudioService get instance => Get.find<AudioService>();

  final AudioPlayer _player = AudioPlayer();

  var currentPlaySong = Rx<SongUrlDatum?>(null);
  var playing = false.obs;

  Future<int> setPlaySong(SongUrlDatum model)async{
    Log.d('SongUrlDatum... ${model.id}');
    await _player.setUrl(model.url);
    await _player.load();
    await _player.play();
    currentPlaySong.value = model;
    playing.value = _player.playing;
    return model.id ;
  }


  bool switchPlayPause(){
    if(_player.playing){
      _player.pause();
    }else{
      _player.play();
    }
    playing.value = _player.playing;
    return playing.value;
  }


}