// To parse this JSON data, do
//
//     final garbageManagementModel = garbageManagementModelFromJson(jsonString);

import 'dart:convert';

GarbageManagementModel garbageManagementModelFromJson(String str) =>
    GarbageManagementModel.fromJson(json.decode(str));

String garbageManagementModelToJson(GarbageManagementModel data) =>
    json.encode(data.toJson());

class GarbageManagementModel {
  GarbageManagementModel({
    required this.message,
    required this.data,
  });

  String message;
  List<GarbageManagementData> data;

  factory GarbageManagementModel.fromJson(Map<String, dynamic> json) =>
      GarbageManagementModel(
        message: json["message"],
        data: List<GarbageManagementData>.from(
            json["data"].map((x) => GarbageManagementData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GarbageManagementData {
  GarbageManagementData({
    required this.day,
    required this.toll,
  });

  Day day;
  Day toll;

  factory GarbageManagementData.fromJson(Map<String, dynamic> json) =>
      GarbageManagementData(
        day: Day.fromJson(json["day"]),
        toll: Day.fromJson(json["toll"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day.toJson(),
        "toll": toll.toJson(),
      };
}

class Day {
  Day({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
