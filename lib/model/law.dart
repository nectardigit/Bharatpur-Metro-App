// To parse this JSON data, do
//
//     final lawModel = lawModelFromJson(jsonString);

import 'dart:convert';

LawModel lawModelFromJson(String str) => LawModel.fromJson(json.decode(str));

String lawModelToJson(LawModel data) => json.encode(data.toJson());

class LawModel {
  LawModel({
    required this.message,
    required this.data,
  });

  String message;
  List<LawData> data;

  factory LawModel.fromJson(Map<String, dynamic> json) => LawModel(
        message: json["message"],
        data: List<LawData>.from(json["data"].map((x) => LawData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LawData {
  LawData({
    this.title,
    this.lawType,
    this.lawLevel,
    this.file,
    this.published,
  });

  Heading? title;

  String? lawType;
  String? lawLevel;

  String? file;
  String? published;

  factory LawData.fromJson(Map<String, dynamic> json) => LawData(
        title: Heading.fromJson(json["title"]),
        lawType: json["law_type"],
        lawLevel: json["law_level"],
        file: json["files"],
        published: json["published"],
      );

  Map<String, dynamic> toJson() => {
        "title": title!.toJson(),
        "law_type": lawType,
        "law_level": lawLevel,
        "files": file,
        "published": published,
      };
}

class Heading {
  Heading({
    required this.en,
    required this.np,
  });

  String en;
  String np;

  factory Heading.fromJson(Map<String, dynamic> json) => Heading(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
