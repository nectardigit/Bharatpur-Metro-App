// To parse this JSON data, do
//
//     final selfPublishingModel = selfPublishingModelFromJson(jsonString);

import 'dart:convert';

SelfPublishingModel selfPublishingModelFromJson(String str) =>
    SelfPublishingModel.fromJson(json.decode(str));

String selfPublishingModelToJson(SelfPublishingModel data) =>
    json.encode(data.toJson());

class SelfPublishingModel {
  SelfPublishingModel({
    this.message,
    this.documentCategory,
    this.data,
  });

  String? message;
  String? documentCategory;
  List<SelfPublishingHeadingModel>? data;

  factory SelfPublishingModel.fromJson(Map<String, dynamic> json) =>
      SelfPublishingModel(
        message: json["message"],
        documentCategory: json["document_category"],
        data: List<SelfPublishingHeadingModel>.from(
            json["data"].map((x) => SelfPublishingHeadingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "document_category": documentCategory,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SelfPublishingHeadingModel {
  SelfPublishingHeadingModel({
    this.id,
    this.title,
    this.files,
    this.date,
    this.documentGroup,
    this.fiscalYear,
    this.period,
    this.subDocumentGroup,
  });

  int? id;
  Title? title;
  String? files;
  dynamic date;
  String? documentGroup;
  String? fiscalYear;
  Title? period;
  String? subDocumentGroup;

  factory SelfPublishingHeadingModel.fromJson(Map<String, dynamic> json) =>
      SelfPublishingHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        files: json["files"],
        date: json["date"],
        documentGroup: json["document_group"],
        fiscalYear: json["fiscal_year"],
        period: json['period'] != null ? Title.fromJson(json["period"]) : null,
        subDocumentGroup: json["sub_document_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "files": files,
        "date": date,
        "document_group": documentGroup,
        "fiscal_year": fiscalYear,
        "period": period!.toJson(),
        "sub_document_group": subDocumentGroup,
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
