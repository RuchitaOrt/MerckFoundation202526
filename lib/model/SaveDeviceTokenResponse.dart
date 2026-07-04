import 'dart:convert';

SaveDeviceTokenResponse saveDeviceTokenResponseFromJson(String str) =>
    SaveDeviceTokenResponse.fromJson(json.decode(str));

String saveDeviceTokenResponseToJson(SaveDeviceTokenResponse data) =>
    json.encode(data.toJson());

class SaveDeviceTokenResponse {
  DeviceData? data;
  ResponseData? response;

  SaveDeviceTokenResponse({
    this.data,
    this.response,
  });

  factory SaveDeviceTokenResponse.fromJson(Map<String, dynamic> json) =>
      SaveDeviceTokenResponse(
        data: json["data"] == null
            ? null
            : DeviceData.fromJson(json["data"]),
        response: json["response"] == null
            ? null
            : ResponseData.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "response": response?.toJson(),
      };
}

class DeviceData {
  int? id;
  String? deviceId;
  String? fcmToken;
  String? platform;
  bool? status;

  DeviceData({
    this.id,
    this.deviceId,
    this.fcmToken,
    this.platform,
    this.status,
  });

  factory DeviceData.fromJson(Map<String, dynamic> json) => DeviceData(
        id: json["id"],
        deviceId: json["device_id"] ?? "",
        fcmToken: json["fcm_token"] ?? "",
        platform: json["platform"] ?? "",
        status: json["status"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "device_id": deviceId,
        "fcm_token": fcmToken,
        "platform": platform,
        "status": status,
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

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
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