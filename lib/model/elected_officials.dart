// To parse this JSON data, do
//
//     final electedOfficialsModel = electedOfficialsModelFromJson(jsonString);

import 'dart:convert';

ElectedOfficialsModel electedOfficialsModelFromJson(String str) =>
    ElectedOfficialsModel.fromJson(json.decode(str));

String electedOfficialsModelToJson(ElectedOfficialsModel data) =>
    json.encode(data.toJson());

class ElectedOfficialsModel {
  ElectedOfficialsModel({
    this.message,
    this.data,
  });

  String? message;
  List<ElectedOfficalsData>? data;

  factory ElectedOfficialsModel.fromJson(Map<String, dynamic> json) =>
      ElectedOfficialsModel(
        message: json["message"],
        data: List<ElectedOfficalsData>.from(
            json["data"].map((x) => ElectedOfficalsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ElectedOfficalsData {
  ElectedOfficalsData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.rank,
    this.tenure,
    this.active,
    this.description,
    this.isWard,
    this.wardNumber,
    this.isExecutive,
    this.executiveDesignation,
    this.isWardMember,
    this.condition,
    this.wardDesignation,
    this.isJudicial,
    this.judicialDesignation,
    this.isCouncil,
    this.councilDesignation,
    this.isSpokeperson,
    this.spokepersonDesignation,
    this.image,
  });

  int? id;
  CouncilDesignation? name;
  String? phone;
  String? email;
  String? rank;
  CouncilDesignation? tenure;
  int? active;
  CouncilDesignation? description;
  int? isWard;
  int? condition;
  CouncilDesignation? wardNumber;
  int? isExecutive;
  CouncilDesignation? executiveDesignation;
  int? isWardMember;
  CouncilDesignation? wardDesignation;
  String? isJudicial;
  CouncilDesignation? judicialDesignation;
  String? isCouncil;
  CouncilDesignation? councilDesignation;
  String? isSpokeperson;
  CouncilDesignation? spokepersonDesignation;
  String? image;

  factory ElectedOfficalsData.fromJson(Map<String, dynamic> json) =>
      ElectedOfficalsData(
        id: json["id"],
        name: CouncilDesignation.fromJson(json["name"]),
        phone: json["phone"],
        email: json["email"],
        rank: json["rank"],
        tenure: CouncilDesignation.fromJson(json["tenure"]),
        active: json["active"],
        description: CouncilDesignation.fromJson(json["description"]),
        isWard: json["is_ward"],
        condition: json["condition"],
        wardNumber: CouncilDesignation.fromJson(json["ward_number"]),
        isExecutive: json["is_executive"],
        executiveDesignation:
            CouncilDesignation.fromJson(json["executive_designation"]),
        isWardMember: json["is_ward_member"],
        wardDesignation: CouncilDesignation.fromJson(json["ward_designation"]),
        isJudicial: json["is_judicial"],
        judicialDesignation:
            CouncilDesignation.fromJson(json["judicial_designation"]),
        isCouncil: json["is_council"],
        councilDesignation:
            CouncilDesignation.fromJson(json["council_designation"]),
        isSpokeperson: json["is_spokeperson"],
        spokepersonDesignation:
            CouncilDesignation.fromJson(json["spokeperson_designation"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name!.toJson(),
        "phone": phone,
        "email": email,
        "rank": rank,
        "tenure": tenure!.toJson(),
        "active": active,
        "description": description!.toJson(),
        "is_ward": isWard,
        "condition": condition,
        "ward_number": wardNumber!.toJson(),
        "is_executive": isExecutive,
        "executive_designation": executiveDesignation!.toJson(),
        "is_ward_member": isWardMember,
        "ward_designation": wardDesignation!.toJson(),
        "is_judicial": isJudicial,
        "judicial_designation": judicialDesignation!.toJson(),
        "is_council": isCouncil,
        "council_designation": councilDesignation!.toJson(),
        "is_spokeperson": isSpokeperson,
        "spokeperson_designation": spokepersonDesignation!.toJson(),
        "image": image,
      };
}

class CouncilDesignation {
  CouncilDesignation({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory CouncilDesignation.fromJson(Map<String, dynamic> json) =>
      CouncilDesignation(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
