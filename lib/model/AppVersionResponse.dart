import 'dart:convert';

AppVersionResponse appVersionResponseFromJson(String str) =>
    AppVersionResponse.fromJson(json.decode(str));

String appVersionResponseToJson(AppVersionResponse data) =>
    json.encode(data.toJson());

class AppVersionResponse {
  AppVersionData? data;
  ResponseData? response;

  AppVersionResponse({
    this.data,
    this.response,
  });

  factory AppVersionResponse.fromJson(Map<String, dynamic> json) =>
      AppVersionResponse(
        data: json["data"] == null
            ? null
            : AppVersionData.fromJson(json["data"]),
        response: json["response"] == null
            ? null
            : ResponseData.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "response": response?.toJson(),
      };
}

class AppVersionData {
  String? androidVersion;
  String? iosVersion;

  AppVersionData({
    this.androidVersion,
    this.iosVersion,
  });

  factory AppVersionData.fromJson(Map<String, dynamic> json) =>
      AppVersionData(
        androidVersion: json["android_version"] ?? "",
        iosVersion: json["ios_version"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "android_version": androidVersion,
        "ios_version": iosVersion,
      };
}

class ResponseData {
  int? n;
  String? msg;
  String? status;

  ResponseData({
    this.n,
    this.msg,
    this.status,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      ResponseData(
        n: json["n"] ?? 0,
        msg: json["msg"] ?? "",
        status: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "n": n,
        "msg": msg,
        "status": status,
      };
}