import 'dart:convert';

class MusicArtistModel {
  MusicArtistModel({
    required this.id,
    required this.name,
    required this.picUrl,
    required this.alias,
    required this.albumSize,
    required this.picId,
    required this.fansGroup,
    required this.img1V1Url,
    required this.img1V1,
    required this.trans,
  });

  final int id;
  final String name;
  final dynamic picUrl;
  final List<dynamic> alias;
  final int albumSize;
  final int picId;
  final dynamic fansGroup;
  final String img1V1Url;
  final int img1V1;
  final dynamic trans;

  factory MusicArtistModel.fromRawJson(String str) => MusicArtistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicArtistModel.fromJson(Map<String, dynamic> json) => MusicArtistModel(
    id: json["id"],
    name: json["name"],
    picUrl: json["picUrl"],
    alias: List<dynamic>.from(json["alias"].map((x) => x)),
    albumSize: json["albumSize"],
    picId: json["picId"],
    fansGroup: json["fansGroup"],
    img1V1Url: json["img1v1Url"],
    img1V1: json["img1v1"],
    trans: json["trans"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picUrl": picUrl,
    "alias": List<dynamic>.from(alias.map((x) => x)),
    "albumSize": albumSize,
    "picId": picId,
    "fansGroup": fansGroup,
    "img1v1Url": img1V1Url,
    "img1v1": img1V1,
    "trans": trans,
  };
}