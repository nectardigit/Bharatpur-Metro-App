// To parse this JSON data, do
//
//     final officeModel = officeModelFromJson(jsonString);

import 'dart:convert';

OfficeModel officeModelFromJson(String str) =>
    OfficeModel.fromJson(json.decode(str));

String officeModelToJson(OfficeModel data) => json.encode(data.toJson());

class OfficeModel {
  OfficeModel({
    this.message,
    this.data,
  });

  String? message;
  List<OfficeHeadingModel>? data;

  factory OfficeModel.fromJson(Map<String, dynamic> json) => OfficeModel(
        message: json["message"],
        data: List<OfficeHeadingModel>.from(
            json["data"].map((x) => OfficeHeadingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OfficeHeadingModel {
  OfficeHeadingModel({
    this.id,
    this.title,
    this.officeType,
    this.rank,
  });

  int? id;
  Title? title;
  OfficeType? officeType;
  int? rank;

  factory OfficeHeadingModel.fromJson(Map<String, dynamic> json) =>
      OfficeHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        officeType: json["office_type"] == null
            ? null
            : OfficeType.fromJson(json["office_type"]),
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "office_type": officeType!.toJson(),
        "rank": rank,
      };
}

class OfficeType {
  OfficeType({
    this.en,
    this.np,
  });

  List<String>? en;
  List<String>? np;

  factory OfficeType.fromJson(Map<String, dynamic> json) => OfficeType(
        en: List<String>.from(json["en"].map((x) => x)),
        np: List<String>.from(json["np"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "en": List<dynamic>.from(en!.map((x) => x)),
        "np": List<dynamic>.from(np!.map((x) => x)),
      };
}

class Title {
  Title({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
