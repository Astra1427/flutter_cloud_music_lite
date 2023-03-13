// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'music_song_model.dart';

class MusicSearchModel {
  MusicSearchModel({
    required this.result,
    required this.code,
  });

  final MusicSearchResultModel result;
  final int code;

  factory MusicSearchModel.fromRawJson(String str) =>
      MusicSearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicSearchModel.fromJson(Map<String, dynamic> json) =>
      MusicSearchModel(
        result: MusicSearchResultModel.fromJson(json["result"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "code": code,
      };
}

class MusicSearchResultModel {
  MusicSearchResultModel({
    required this.songs,
    required this.hasMore,
    required this.songCount,
  });

  final List<MusicSongModel> songs;
  final bool hasMore;
  final int songCount;

  factory MusicSearchResultModel.fromRawJson(String str) =>
      MusicSearchResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicSearchResultModel.fromJson(Map<String, dynamic> json) =>
      MusicSearchResultModel(
        songs: List<MusicSongModel>.from(
            json["songs"].map((x) => MusicSongModel.fromJson(x))),
        hasMore: json["hasMore"],
        songCount: json["songCount"],
      );

  Map<String, dynamic> toJson() => {
        "songs": List<dynamic>.from(songs.map((x) => x.toJson())),
        "hasMore": hasMore,
        "songCount": songCount,
      };
}
