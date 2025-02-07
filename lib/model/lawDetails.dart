// To parse this JSON data, do
//
//     final lawModel = lawModelFromJson(jsonString);

import 'dart:convert';

LawDetailsModel lawModelFromJson(String str) =>
    LawDetailsModel.fromJson(json.decode(str));

String lawModelToJson(LawDetailsModel data) => json.encode(data.toJson());

class LawDetailsModel {
  LawDetailsModel({
    required this.message,
    required this.data,
  });

  String message;
  List<LawDetailsData> data;

  factory LawDetailsModel.fromJson(Map<String, dynamic> json) =>
      LawDetailsModel(
        message: json["message"],
        data: List<LawDetailsData>.from(
            json["data"].map((x) => LawDetailsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LawDetailsData {
  LawDetailsData({
    required this.title,
    required this.heading,
    required this.lawName,
    required this.lawType,
    required this.lawLevel,
    required this.slug,
    required this.status,
    required this.document,
  });

  Heading title;
  Heading heading;
  Heading lawName;
  Heading lawType;
  Heading lawLevel;
  String slug;
  int status;
  String document;

  factory LawDetailsData.fromJson(Map<String, dynamic> json) => LawDetailsData(
        title: Heading.fromJson(json["title"]),
        heading: Heading.fromJson(json["heading"]),
        lawName: Heading.fromJson(json["law_name"]),
        lawType: Heading.fromJson(json["law_type"]),
        lawLevel: Heading.fromJson(json["law_level"]),
        slug: json["slug"],
        status: json["status"],
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "heading": heading.toJson(),
        "law_name": lawName.toJson(),
        "law_type": lawType.toJson(),
        "law_level": lawLevel.toJson(),
        "slug": slug,
        "status": status,
        "document": document,
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
