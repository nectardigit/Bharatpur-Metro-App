// To parse this JSON data, do
//
//     final civilWardPaperModel = civilWardPaperModelFromJson(jsonString);

import 'dart:convert';

CivilWardPaperModel civilWardPaperModelFromJson(String str) =>
    CivilWardPaperModel.fromJson(json.decode(str));

String civilWardPaperModelToJson(CivilWardPaperModel data) =>
    json.encode(data.toJson());

class CivilWardPaperModel {
  CivilWardPaperModel({
    this.message,
    this.data,
  });

  String? message;
  Map<String, List<CivilWardPaperHeadingModel>>? data;

  factory CivilWardPaperModel.fromJson(Map<String, dynamic> json) =>
      CivilWardPaperModel(
        message: json["message"],
        data: json["data"] == null
            ? null
            : Map.from(json["data"]).map((k, v) =>
            MapEntry<String, List<CivilWardPaperHeadingModel>>(
                k,
                List<CivilWardPaperHeadingModel>.from(
                    v.map((x) => CivilWardPaperHeadingModel.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class CivilWardPaperHeadingModel {
  CivilWardPaperHeadingModel({
    this.id,
    this.services,
    this.importantPaper,
    this.process,
    this.toTakeTime,
    this.serviceOffice,
    this.responsibleOfficer,
    this.serviceGroup,
    this.whichservice,
    this.link,
  });

  int? id;
  ImportantPaper? services;
  ImportantPaper? importantPaper;
  ImportantPaper? process;
  ImportantPaper? toTakeTime;
  ImportantPaper? serviceOffice;
  ImportantPaper? responsibleOfficer;
  ImportantPaper? serviceGroup;
  ImportantPaper? whichservice;
  String? link;

  factory CivilWardPaperHeadingModel.fromJson(Map<String, dynamic> json) =>
      CivilWardPaperHeadingModel(
        id: json["id"],
        services: ImportantPaper.fromJson(json["services"]),
        importantPaper: ImportantPaper.fromJson(json["important_paper"]),
        process: ImportantPaper.fromJson(json["process"]),
        toTakeTime: ImportantPaper.fromJson(json["to_take_time"]),
        serviceOffice: ImportantPaper.fromJson(json["service_office"]),
        responsibleOfficer:
        ImportantPaper.fromJson(json["responsible_officer"]),
        serviceGroup: ImportantPaper.fromJson(json["service_group"]),
        whichservice: ImportantPaper.fromJson(json["whichservice"]),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "services": services!.toJson(),
    "important_paper": importantPaper!.toJson(),
    "process": process!.toJson(),
    "to_take_time": toTakeTime!.toJson(),
    "service_office": serviceOffice!.toJson(),
    "responsible_officer": responsibleOfficer!.toJson(),
    "service_group": serviceGroup!.toJson(),
    "whichservice": whichservice!.toJson(),
    "link": link,
  };
}

class ImportantPaper {
  ImportantPaper({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory ImportantPaper.fromJson(Map<String, dynamic> json) => ImportantPaper(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
