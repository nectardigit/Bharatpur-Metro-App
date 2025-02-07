// To parse this JSON data, do
//
//     final organizationStructureModel = organizationStructureModelFromJson(jsonString);

import 'dart:convert';

OrganizationStructureModel organizationStructureModelFromJson(String str) =>
    OrganizationStructureModel.fromJson(json.decode(str));

String organizationStructureModelToJson(OrganizationStructureModel data) =>
    json.encode(data.toJson());

class OrganizationStructureModel {
  OrganizationStructureModel({
    required this.message,
    required this.data,
  });

  String? message;
  List<OrganizationStructureData>? data;

  factory OrganizationStructureModel.fromJson(Map<String, dynamic> json) =>
      OrganizationStructureModel(
        message: json["message"],
        data: List<OrganizationStructureData>.from(
            json["data"].map((x) => OrganizationStructureData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrganizationStructureData {
  OrganizationStructureData({
    required this.title,
    required this.details,
    required this.heading,
    required this.slug,
    required this.status,
  });

  DetailsData? title;
  DetailsData? details;
  DetailsData? heading;
  String? slug;
  int? status;

  factory OrganizationStructureData.fromJson(Map<String, dynamic> json) =>
      OrganizationStructureData(
        details: DetailsData.fromJson(json["details"]),
        heading: DetailsData.fromJson(json["heading"]),
        title: DetailsData.fromJson(json["title"]),
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title!.toJson(),
        "details": details!.toJson(),
        "heading": heading!.toJson(),
        "slug": slug,
        "status": status,
      };
}

class DetailsData {
  DetailsData({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
