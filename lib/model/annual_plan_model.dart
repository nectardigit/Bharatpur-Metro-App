// To parse this JSON data, do
//
//     final annualPlanModel = annualPlanModelFromJson(jsonString);

import 'dart:convert';

AnnualPlanModel annualPlanModelFromJson(String str) =>
    AnnualPlanModel.fromJson(json.decode(str));

String annualPlanModelToJson(AnnualPlanModel data) =>
    json.encode(data.toJson());

class AnnualPlanModel {
  AnnualPlanModel({
    required this.message,
    required this.data,
  });

  String message;
  List<AnnualPlanData> data;

  factory AnnualPlanModel.fromJson(Map<String, dynamic> json) =>
      AnnualPlanModel(
        message: json["message"],
        data: List<AnnualPlanData>.from(
            json["data"].map((x) => AnnualPlanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AnnualPlanData {
  AnnualPlanData({
    required this.id,
    required this.title,
    required this.name,
    required this.details,
    required this.date,
    required this.slug,
    required this.status,
  });
  int? id;
  Details? title;
  Details? name;
  Details? details;
  String? date;
  String? slug;
  int? status;

  factory AnnualPlanData.fromJson(Map<String, dynamic> json) => AnnualPlanData(
    id: json["id"],
        title: Details.fromJson(json["title"]),
        name: Details.fromJson(json["name"]),
        details: Details.fromJson(json["details"]),
        date:json["date"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    'id':id,
        "title": title!.toJson(),
        "name": name!.toJson(),
        "details": details!.toJson(),
        "date":
            date,
        "slug": slug,
        "status": status,
      };
}

class Details {
  Details({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
