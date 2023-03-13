
import 'dart:convert';

class RegisterAnonymousModel {
  RegisterAnonymousModel({
    required this.code,
    required this.userId,
    required this.createTime,
    required this.cookie,
  });

  final int code;
  final int userId;
  final int createTime;
  final String cookie;

  factory RegisterAnonymousModel.fromRawJson(String str) => RegisterAnonymousModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterAnonymousModel.fromJson(Map<String, dynamic> json) => RegisterAnonymousModel(
    code: json["code"],
    userId: json["userId"],
    createTime: json["createTime"],
    cookie: json["cookie"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "userId": userId,
    "createTime": createTime,
    "cookie": cookie,
  };
}
