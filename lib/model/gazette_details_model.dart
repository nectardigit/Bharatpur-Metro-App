// To parse this JSON data, do
//
//     final gezetteModel = gezetteModelFromJson(jsonString);

import 'dart:convert';

GezetteDetailsModel gezetteModelFromJson(String str) =>
    GezetteDetailsModel.fromJson(json.decode(str));

String gezetteModelToJson(GezetteDetailsModel data) => json.encode(data.toJson());

class GezetteDetailsModel {
  GezetteDetailsModel({
    required this.message,
    required this.data,
  });

  String? message;
  List<GezetteDetailsData>? data;

  factory GezetteDetailsModel.fromJson(Map<String, dynamic> json) => GezetteDetailsModel(
        message: json["message"],
        data: List<GezetteDetailsData>.from(
            json["data"].map((x) => GezetteDetailsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GezetteDetailsData {
  GezetteDetailsData({
    required this.title,
    required this.heading,
    required this.link,
    required this.status,
    required this.document,
    required this.publishedDate,
  });
  Document? title;
  Document? heading;
  String? link;
  int? status;
  Document? document;
  String? publishedDate;

  factory GezetteDetailsData.fromJson(Map<String, dynamic> json) => GezetteDetailsData(
        title: Document.fromJson(json["title"]),
        heading: Document.fromJson(json["heading"]),
        link: json["link"],
        status: json["status"],
        document: Document.fromJson(json["document"]),
        publishedDate: json["published_date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title!.toJson(),
        "heading": heading!.toJson(),
        "link": link,
        "status": status,
        "document": document!.toJson(),
        "published_date": publishedDate,
      };
}

class Document {
  Document({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
