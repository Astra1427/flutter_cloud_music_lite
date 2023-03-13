import 'package:flutter/material.dart';
import 'package:flutter_cloud_music_lite/app/log.dart';
import 'package:flutter_cloud_music_lite/models/music/music_song_model.dart';
import 'package:flutter_cloud_music_lite/services/audio_service.dart';
import 'package:flutter_cloud_music_lite/widgets/rotation_image_widget.dart';
import 'package:get/get.dart';

class MusicListItem extends StatelessWidget {
  const MusicListItem(
      {Key? key,
      required this.model,
      this.itemClick,
      required this.animationController, required this.isPlaying})
      : super(key: key);
  final MusicSongModel model;
  final void Function(MusicSongModel model)? itemClick;

  final AnimationController animationController;
  final bool isPlaying ;

  @override
  Widget build(BuildContext context) {
    var isRotation =
        AudioService.instance.currentPlaySong.value?.id == model.id &&
            AudioService.instance.playing.value;

    Log.d('isRotation ... $isRotation');

    return InkWell(
      onTap: () {
        Log.d('ListTile... ${model.duration}');
        itemClick?.call(model);
      },
      child: ListTile(
        title: Text(model.name),
        leading: isPlaying
            ? RotationImageWidget(
                animationController: animationController,
                width: 30,
                height: 30,
                child: const Icon(
                  Icons.music_note_rounded,
                  size: 25,
                ))
            : const Icon(
                Icons.music_note_rounded,
                size: 25,
              ),
        subtitle: Text(model.artists.map((e) => e.name).join(',')),
        trailing: isPlaying
            ? RotationImageWidget(
                width: 50,
                height: 50,
                animationController: animationController,
                child: Image.network(
                  model.artists.first.img1V1Url,
                  fit: BoxFit.fill,
                ),
              )
            : SizedBox(
                width: 50,
                height: 50,
                child: ClipOval(
                  child: Image.network(
                    model.artists.first.img1V1Url,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
      ),
    );
  }
}
