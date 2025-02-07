// To parse this JSON data, do
//
//     final cityScopeModel = cityScopeModelFromJson(jsonString);

import 'dart:convert';

CityScopeModel cityScopeModelFromJson(String str) =>
    CityScopeModel.fromJson(json.decode(str));

String cityScopeModelToJson(CityScopeModel data) => json.encode(data.toJson());

class CityScopeModel {
  CityScopeModel({
    this.message,
    this.data,
  });

  String? message;
  List<CityScapeHeadingModel>? data;

  factory CityScopeModel.fromJson(Map<String, dynamic> json) => CityScopeModel(
        message: json["message"],
        data: List<CityScapeHeadingModel>.from(
            json["data"].map((x) => CityScapeHeadingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CityScapeHeadingModel {
  CityScapeHeadingModel({
    this.id,
    this.title,
    this.document,
    this.createdAt,
  });

  int? id;
  BannerTitle? title;
  String? document;
  String? createdAt;

  factory CityScapeHeadingModel.fromJson(Map<String, dynamic> json) =>
      CityScapeHeadingModel(
        id: json["id"],
        title: BannerTitle.fromJson(json["title"]),
        document: json["document"],
        createdAt: json['published_date'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner_title": title!.toJson(),
        "document": document,
        "published_date": createdAt
      };
}

class BannerTitle {
  BannerTitle({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory BannerTitle.fromJson(Map<String, dynamic> json) => BannerTitle(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
