// To parse this JSON data, do
//
//     final civilWardPaperModel = civilWardPaperModelFromJson(jsonString);

import 'dart:convert';

Phones phonesModelFromJson(String str) =>
    Phones.fromJson(json.decode(str));

String phonesModelToJson(Phones data) => json.encode(data.toJson());

class Phones {
  Phones({
    this.message,
    this.data,
  });

  String? message;
  Map<String, List<PhoneData>>? data;

  factory Phones.fromJson(Map<String, dynamic> json) => Phones(
        message: json["message"],
        data: json["data"] == null
            ? null
            : Map.from(json["data"]).map((k, v) =>
                MapEntry<String, List<PhoneData>>(k,
                    List<PhoneData>.from(v.map((x) => PhoneData.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class PhoneData {
  PhoneData({
    this.id,
    this.contGroup,
    this.name,
    this.phone,
  });

  int? id;
  ContGroup? contGroup;
  ContGroup? name;
  ContGroup? phone;

  factory PhoneData.fromJson(Map<String, dynamic> json) => PhoneData(
        id: json["id"],
        contGroup: ContGroup.fromJson(json["cont_group"]),
        name: ContGroup.fromJson(json["name"]),
        phone: ContGroup.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cont_group": contGroup!.toJson(),
        "name": name!.toJson(),
        "phone": phone!.toJson(),
      };
}

class ContGroup {
  ContGroup({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory ContGroup.fromJson(Map<String, dynamic> json) => ContGroup(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
