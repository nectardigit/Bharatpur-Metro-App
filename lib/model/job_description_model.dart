// To parse this JSON data, do
//
//     final jobDescriptionModel = jobDescriptionModelFromJson(jsonString);

import 'dart:convert';

JobDescriptionModel jobDescriptionModelFromJson(String str) =>
    JobDescriptionModel.fromJson(json.decode(str));

String jobDescriptionModelToJson(JobDescriptionModel data) =>
    json.encode(data.toJson());

class JobDescriptionModel {
  JobDescriptionModel({
    this.message,
    this.data,
  });

  String? message;
  List<JobDescriptionHeaderModel>? data;

  factory JobDescriptionModel.fromJson(Map<String, dynamic> json) =>
      JobDescriptionModel(
        message: json["message"],
        data: List<JobDescriptionHeaderModel>.from(
            json["data"].map((x) => JobDescriptionHeaderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JobDescriptionHeaderModel {
  JobDescriptionHeaderModel({
    this.id,
    this.title,
    this.jdType,
    this.jdTypeName,
    this.details,
    this.division,
    this.branch,
    this.subDivision,
    this.office,
  });

  int? id;
  Details? title;
  String? jdType;
  String? jdTypeName;
  Details? details;
  Details? division;
  Details? branch;
  Details? subDivision;
  Details? office;

  factory JobDescriptionHeaderModel.fromJson(Map<String, dynamic> json) =>
      JobDescriptionHeaderModel(
        id: json["id"],
        title: Details.fromJson(json["title"]),
        jdType: json["jd_type"],
        jdTypeName: json["jd_type_name"],
        details: Details.fromJson(json["details"]),
        division: json["division"] == null
            ? null
            : Details.fromJson(json["division"]),
        branch:
            json["branch"] == null ? null : Details.fromJson(json["branch"]),
        // ignore: prefer_if_null_operators
        subDivision: json["sub-division"] == null
            ? null
            : Details.fromJson(json["sub-division"]),
        office:
            json["office"] == null ? null : Details.fromJson(json["office"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "jd_type": jdType,
        "jd_type_name": jdTypeName,
        "details": details!.toJson(),
        "division": division!.toJson(),
        "branch": branch!.toJson(),
        "sub-division": subDivision!.toJson(),
        "office": office!.toJson(),
      };
}

class Details {
  Details({
    this.en,
    this.np,
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

// enum JdTypeName { SECTION, SUB_SECTION, OFFICE, DIVISION }

// final jdTypeNameValues = EnumValues({
//     "Division": JdTypeName.DIVISION,
//     "Office": JdTypeName.OFFICE,
//     "Section": JdTypeName.SECTION,
//     "Sub-Section": JdTypeName.SUB_SECTION
// });

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
