// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SongUrlsModel {
  SongUrlsModel({
    required this.data,
    required this.code,
  });

  final List<SongUrlDatum> data;
  final int code;

  factory SongUrlsModel.fromRawJson(String str) => SongUrlsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SongUrlsModel.fromJson(Map<String, dynamic> json) => SongUrlsModel(
    data: List<SongUrlDatum>.from(json["data"].map((x) => SongUrlDatum.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "code": code,
  };
}

class SongUrlDatum {
  SongUrlDatum({
    required this.id,
    required this.url,
    required this.br,
    required this.size,
    required this.md5,
    required this.code,
    required this.expi,
    required this.type,
    required this.gain,
    required this.peak,
    required this.fee,
    required this.uf,
    required this.payed,
    required this.flag,
    required this.canExtend,
    required this.freeTrialInfo,
    required this.level,
    required this.encodeType,
    required this.freeTrialPrivilege,
    required this.freeTimeTrialPrivilege,
    required this.urlSource,
    required this.rightSource,
    required this.podcastCtrp,
    required this.effectTypes,
    required this.time,
  });

  final int id;
  final String url;
  final int br;
  final int size;
  final String md5;
  final int code;
  final int expi;
  final String type;
  final num gain;
  final num peak;
  final int fee;
  final dynamic uf;
  final int payed;
  final int flag;
  final bool canExtend;
  final FreeTrialInfo? freeTrialInfo;
  final String level;
  final String encodeType;
  final FreeTrialPrivilege freeTrialPrivilege;
  final FreeTimeTrialPrivilege freeTimeTrialPrivilege;
  final int urlSource;
  final int rightSource;
  final dynamic podcastCtrp;
  final dynamic effectTypes;
  final int time;

  factory SongUrlDatum.fromRawJson(String str) => SongUrlDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SongUrlDatum.fromJson(Map<String, dynamic> json) => SongUrlDatum(
    id: json["id"],
    url: json["url"],
    br: json["br"],
    size: json["size"],
    md5: json["md5"],
    code: json["code"],
    expi: json["expi"],
    type: json["type"],
    gain: json["gain"],
    peak: json["peak"],
    fee: json["fee"],
    uf: json["uf"],
    payed: json["payed"],
    flag: json["flag"],
    canExtend: json["canExtend"],
    freeTrialInfo:json["freeTrialInfo"] == null ? null : FreeTrialInfo.fromJson(json["freeTrialInfo"]),
    level: json["level"],
    encodeType: json["encodeType"],
    freeTrialPrivilege: FreeTrialPrivilege.fromJson(json["freeTrialPrivilege"]),
    freeTimeTrialPrivilege: FreeTimeTrialPrivilege.fromJson(json["freeTimeTrialPrivilege"]),
    urlSource: json["urlSource"],
    rightSource: json["rightSource"],
    podcastCtrp: json["podcastCtrp"],
    effectTypes: json["effectTypes"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "br": br,
    "size": size,
    "md5": md5,
    "code": code,
    "expi": expi,
    "type": type,
    "gain": gain,
    "peak": peak,
    "fee": fee,
    "uf": uf,
    "payed": payed,
    "flag": flag,
    "canExtend": canExtend,
    "freeTrialInfo": freeTrialInfo?.toJson(),
    "level": level,
    "encodeType": encodeType,
    "freeTrialPrivilege": freeTrialPrivilege.toJson(),
    "freeTimeTrialPrivilege": freeTimeTrialPrivilege.toJson(),
    "urlSource": urlSource,
    "rightSource": rightSource,
    "podcastCtrp": podcastCtrp,
    "effectTypes": effectTypes,
    "time": time,
  };
}

class FreeTimeTrialPrivilege {
  FreeTimeTrialPrivilege({
    required this.resConsumable,
    required this.userConsumable,
    required this.type,
    required this.remainTime,
  });

  final bool resConsumable;
  final bool userConsumable;
  final int type;
  final int remainTime;

  factory FreeTimeTrialPrivilege.fromRawJson(String str) => FreeTimeTrialPrivilege.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FreeTimeTrialPrivilege.fromJson(Map<String, dynamic> json) => FreeTimeTrialPrivilege(
    resConsumable: json["resConsumable"],
    userConsumable: json["userConsumable"],
    type: json["type"],
    remainTime: json["remainTime"],
  );

  Map<String, dynamic> toJson() => {
    "resConsumable": resConsumable,
    "userConsumable": userConsumable,
    "type": type,
    "remainTime": remainTime,
  };
}

class FreeTrialInfo {
  FreeTrialInfo({
    required this.start,
    required this.end,
  });

  final int start;
  final int end;

  factory FreeTrialInfo.fromRawJson(String str) => FreeTrialInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FreeTrialInfo.fromJson(Map<String, dynamic> json) => FreeTrialInfo(
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
  };
}

class FreeTrialPrivilege {
  FreeTrialPrivilege({
    required this.resConsumable,
    required this.userConsumable,
    required this.listenType,
    required this.cannotListenReason,
  });

  final bool resConsumable;
  final bool userConsumable;
  final dynamic listenType;
  final int? cannotListenReason;

  factory FreeTrialPrivilege.fromRawJson(String str) => FreeTrialPrivilege.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FreeTrialPrivilege.fromJson(Map<String, dynamic> json) => FreeTrialPrivilege(
    resConsumable: json["resConsumable"],
    userConsumable: json["userConsumable"],
    listenType: json["listenType"],
    cannotListenReason: json["cannotListenReason"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "resConsumable": resConsumable,
    "userConsumable": userConsumable,
    "listenType": listenType,
    "cannotListenReason": cannotListenReason,
  };
}
