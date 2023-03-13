import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cloud_music_lite/pages/music/music_home_controller.dart';
import 'package:flutter_cloud_music_lite/services/audio_service.dart';
import 'package:flutter_cloud_music_lite/widgets/music/music_list_item.dart';
import 'package:flutter_cloud_music_lite/widgets/refresh_list_view.dart';
import 'package:get/get.dart';

import '../../app/controller/app_settings_controller.dart';
import '../../generated/locales.g.dart';

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({Key? key}) : super(key: key);

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> with SingleTickerProviderStateMixin{

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =

    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..animateTo(1)
      ..repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.app_name.tr),
      ),
      body: GetBuilder(
        init: Get.find<MusicHomeController>(),
        builder: (controller){
          return Obx(()=>RefreshListView(
            itemBuilder: (context, index) {
              return MusicListItem(
                itemClick: (model){
                  controller.playAudio(model);
                },
                model: controller.lists[index],
                animationController: animationController,
                isPlaying: controller.playingId.value == controller.lists[index].id &&
                    AudioService.instance.playing.value,
              );
            },
            onLoad: () {
              controller.refreshMusic();
            },
            onRefresh: () {
              controller.refreshMusic();
            },
            itemCount: controller.lists.length,
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var controller = Get.find<MusicHomeController>();
          controller.changeLanguage();
        },
        child: Icon(Icons.language),
      ),
    );
  }
}

