// To parse this JSON data, do
//
//     final budget = budgetFromJson(jsonString);

import 'dart:convert';

Budget budgetFromJson(String str) => Budget.fromJson(json.decode(str));

String budgetToJson(Budget data) => json.encode(data.toJson());

class Budget {
  Budget({
    required this.message,
    required this.data,
  });

  String? message;
  List<BudgetData>? data;

  factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        message: json["message"],
        data: List<BudgetData>.from(
            json["data"].map((x) => BudgetData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BudgetData {
  BudgetData({
    this.published,
    this.files,
    required this.title,
    this.id,
  });

  String? published;
  String? files;
  LawLevel? title;
  // LawLevel? lawType;
  // LawLevel? lawLevel;
  // String? slug;
  int? id;

  factory BudgetData.fromJson(Map<String, dynamic> json) => BudgetData(
        published: json[""],
        files: json["files"],
        title: LawLevel.fromJson(json["title"]),
        // lawType: LawLevel.fromJson(json["law_type"]),
        // lawLevel: LawLevel.fromJson(json["law_level"]),
        // slug: json["slug"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "published": published,
        "files": files,
        "title": title!.toJson(),
        // "law_type": lawType!.toJson(),
        // "law_level": lawLevel!.toJson(),
        // "slug": slug,
        "id": id,
      };
}

class Documents {
  Documents({
    required this.pdf1,
    required this.pdf2,
  });

  String? pdf1;
  String? pdf2;

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        pdf1: json["pdf1"],
        pdf2: json["pdf2"],
      );

  Map<String, dynamic> toJson() => {
        "pdf1": pdf1,
        "pdf2": pdf2,
      };
}

class LawLevel {
  LawLevel({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory LawLevel.fromJson(Map<String, dynamic> json) => LawLevel(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
