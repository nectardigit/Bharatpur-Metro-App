// To parse this JSON data, do
//
//     final fiscalYearModel = fiscalYearModelFromJson(jsonString);

import 'dart:convert';

FiscalYearModel fiscalYearModelFromJson(String str) =>
    FiscalYearModel.fromJson(json.decode(str));

String fiscalYearModelToJson(FiscalYearModel data) =>
    json.encode(data.toJson());

class FiscalYearModel {
  FiscalYearModel({
    this.message,
    this.data,
  });

  String? message;
  List<FiscalYearHeadingModel>? data;

  factory FiscalYearModel.fromJson(Map<String, dynamic> json) =>
      FiscalYearModel(
        message: json["message"],
        data: List<FiscalYearHeadingModel>.from(
            json["data"].map((x) => FiscalYearHeadingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FiscalYearHeadingModel {
  FiscalYearHeadingModel({
    this.id,
    this.fiscalYear,
    this.enTitle,
    this.npTitle,
  });

  int? id;
  String? fiscalYear;
  String? enTitle;
  String? npTitle;

  factory FiscalYearHeadingModel.fromJson(Map<String, dynamic> json) =>
      FiscalYearHeadingModel(
        id: json["id"],
        fiscalYear: json["fiscal_year"],
        enTitle: json["en_title"],
        npTitle: json["np_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fiscal_year": fiscalYear,
        "en_title": enTitle,
        "np_title": npTitle,
      };
}
