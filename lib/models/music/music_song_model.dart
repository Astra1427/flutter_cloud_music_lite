import 'dart:convert';

import 'music_album_model.dart';
import 'music_artist_model.dart';

class MusicSongModel {
  MusicSongModel({
    required this.id,
    required this.name,
    required this.artists,
    required this.album,
    required this.duration,
    required this.copyrightId,
    required this.status,
    required this.alias,
    required this.rtype,
    required this.ftype,
    required this.mvid,
    required this.fee,
    required this.rUrl,
    required this.mark,
  });

  final int id;
  final String name;
  final List<MusicArtistModel> artists;
  final MusicAlbumModel album;
  final int duration;
  final int copyrightId;
  final int status;
  final List<dynamic> alias;
  final int rtype;
  final int ftype;
  final int mvid;
  final int fee;
  final dynamic rUrl;
  final double mark;

  factory MusicSongModel.fromRawJson(String str) => MusicSongModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicSongModel.fromJson(Map<String, dynamic> json) => MusicSongModel(
    id: json["id"],
    name: json["name"],
    artists: List<MusicArtistModel>.from(json["artists"].map((x) => MusicArtistModel.fromJson(x))),
    album: MusicAlbumModel.fromJson(json["album"]),
    duration: json["duration"],
    copyrightId: json["copyrightId"],
    status: json["status"],
    alias: List<dynamic>.from(json["alias"].map((x) => x)),
    rtype: json["rtype"],
    ftype: json["ftype"],
    mvid: json["mvid"],
    fee: json["fee"],
    rUrl: json["rUrl"],
    mark: json["mark"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "album": album.toJson(),
    "duration": duration,
    "copyrightId": copyrightId,
    "status": status,
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "rtype": rtype,
    "ftype": ftype,
    "mvid": mvid,
    "fee": fee,
    "rUrl": rUrl,
    "mark": mark,
  };
}


