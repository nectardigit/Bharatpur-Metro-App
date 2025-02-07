// To parse this JSON data, do
//
//     final waterModel = waterModelFromJson(jsonString);

import 'dart:convert';

WaterModel waterModelFromJson(String str) =>
    WaterModel.fromJson(json.decode(str));

String waterModelToJson(WaterModel data) => json.encode(data.toJson());

class WaterModel {
  WaterModel({
    required this.message,
    required this.data,
  });

  String message;
  List<WaterData> data;

  factory WaterModel.fromJson(Map<String, dynamic> json) => WaterModel(
        message: json["message"],
        data: List<WaterData>.from(
            json["data"].map((x) => WaterData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WaterData {
  WaterData({
    required this.id,
    required this.title,
    required this.file,
    required this.date,
    required this.status,
  });

  int? id;
  Title? title;
  String? file;
  String? date;
  int? status;

  factory WaterData.fromJson(Map<String, dynamic> json) => WaterData(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        file: json["file"],
        date: json["date"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "file": file,
        "date": date,
        "status": status,
      };
}

class Title {
  Title({
    required this.en,
    required this.np,
  });

  String en;
  String np;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
