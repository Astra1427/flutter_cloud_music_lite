import 'dart:convert';

import 'music_artist_model.dart';

class MusicAlbumModel {
  MusicAlbumModel({
    required this.id,
    required this.name,
    required this.artist,
    required this.publishTime,
    required this.size,
    required this.copyrightId,
    required this.status,
    required this.picId,
    required this.mark,
  });

  final int id;
  final String name;
  final MusicArtistModel artist;
  final int publishTime;
  final int size;
  final int copyrightId;
  final int status;
  final double picId;
  final int mark;

  factory MusicAlbumModel.fromRawJson(String str) => MusicAlbumModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicAlbumModel.fromJson(Map<String, dynamic> json) => MusicAlbumModel(
    id: json["id"],
    name: json["name"],
    artist: MusicArtistModel.fromJson(json["artist"]),
    publishTime: json["publishTime"],
    size: json["size"],
    copyrightId: json["copyrightId"],
    status: json["status"],
    picId: json["picId"]?.toDouble(),
    mark: json["mark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "artist": artist.toJson(),
    "publishTime": publishTime,
    "size": size,
    "copyrightId": copyrightId,
    "status": status,
    "picId": picId,
    "mark": mark,
  };
}
