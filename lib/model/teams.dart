// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'dart:convert';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

class Team {
  Team({
    this.message,
    this.module,
    this.data,
  });

  String? message;
  String? module;
  List<TeamData>? data;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        message: json["message"],
        module: json["Module"],
        data:
            List<TeamData>.from(json["data"].map((x) => TeamData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Module": module,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TeamData {
  TeamData({
    this.id,
    this.name,
    this.type,
    this.condition,
    this.address,
    this.detail,
    this.profile,
    this.email,
    this.phone,
    this.designation,
    this.level,
    this.category,
    this.office,
    this.hrmId,
    this.division,
    this.branch,
    this.subbranch,
    this.teamclass,
    this.isCao,
    this.isInformationOfficer,
  });

  int? id;
  int? condition;
  Branch? name;
  Branch? type;
  String? address;
  dynamic detail;
  String? profile;
  String? email;
  String? phone;
  Branch? designation;
  Branch? level;
  Branch? category;
  Branch? office;
  int? hrmId;
  Branch? division;
  Branch? branch;
  Branch? subbranch;
  Branch? teamclass;
  int? isCao;
  int? isInformationOfficer;

  factory TeamData.fromJson(Map<String, dynamic> json) => TeamData(
        id: json["id"],
        condition: json["condition"],
        name: Branch.fromJson(json["name"]),
        type: Branch.fromJson(json["type"]),
        address: json["address"],
        detail: json["detail"],
        profile: json["profile"],
        email: json["email"],
        phone: json["phone"],
        designation: Branch.fromJson(json["designation"]),
        level: Branch.fromJson(json["level"]),
        category: Branch.fromJson(json["category"]),
        office: Branch.fromJson(json["office"]),
        hrmId: json["hrm_id"],
        division: Branch.fromJson(json["division"]),
        branch: Branch.fromJson(json["branch"]),
        subbranch: Branch.fromJson(json["subbranch"]),
        teamclass: Branch.fromJson(json["teamclass"]),
        isCao: json["is_cao"],
        isInformationOfficer: json["is_information_officer"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "condition": condition,
        "name": name!.toJson(),
        "type": type!.toJson(),
        "address": address,
        "detail": detail,
        "profile": profile,
        "email": email,
        "phone": phone,
        "designation": designation!.toJson(),
        "level": level!.toJson(),
        "category": category!.toJson(),
        "office": office!.toJson(),
        "hrm_id": hrmId,
        "division": division!.toJson(),
        "branch": branch!.toJson(),
        "subbranch": subbranch!.toJson(),
        "teamclass": teamclass!.toJson(),
        "is_cao": isCao,
        "is_information_officer": isInformationOfficer,
      };
}

// enum Address {
//   JHAPA,
//   SURYODAYA_10,
//   ADDRESS_SURYODAYA_10,
//   PURPLE_SURYODAYA_10,
//   SURYODAYA_1,
//   SURYODAYA_4,
//   FLUFFY_SURYODAYA_10
// }

// final addressValues = EnumValues({
//   "Suryodaya-10": Address.ADDRESS_SURYODAYA_10,
//   "suryodaya 10": Address.FLUFFY_SURYODAYA_10,
//   "Jhapa": Address.JHAPA,
//   "Suryodaya 10": Address.PURPLE_SURYODAYA_10,
//   "suryodaya 1": Address.SURYODAYA_1,
//   "suryodaya-10": Address.SURYODAYA_10,
//   "suryodaya 4": Address.SURYODAYA_4
// });

class Branch {
  Branch({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
