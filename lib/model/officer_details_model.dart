// To parse this JSON data, do
//
//     final officerDetailsModel = officerDetailsModelFromJson(jsonString);

import 'dart:convert';

OfficerDetailsModel officerDetailsModelFromJson(String str) =>
    OfficerDetailsModel.fromJson(json.decode(str));

String officerDetailsModelToJson(OfficerDetailsModel data) =>
    json.encode(data.toJson());

class OfficerDetailsModel {
  OfficerDetailsModel({
    required this.message,
    required this.data,
  });

  String? message;
  List<OfficerDetailsData>? data;

  factory OfficerDetailsModel.fromJson(Map<String, dynamic> json) =>
      OfficerDetailsModel(
        message: json["message"],
        data: List<OfficerDetailsData>.from(
            json["data"].map((x) => OfficerDetailsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OfficerDetailsData {
  OfficerDetailsData({
    required this.details,
    required this.designation,
  });

  Designation? details;
  Designation? designation;

  factory OfficerDetailsData.fromJson(Map<String, dynamic> json) =>
      OfficerDetailsData(
        details: Designation.fromJson(json["details"]),
        designation: Designation.fromJson(json["designation"]),
      );

  Map<String, dynamic> toJson() => {
        "details": details!.toJson(),
        "designation": designation!.toJson(),
      };
}

class Designation {
  Designation({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
