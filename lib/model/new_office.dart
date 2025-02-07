// To parse this JSON data, do
//
//     final officeModelScreen = officeModelScreenFromJson(jsonString);

import 'dart:convert';

OfficeModelScreen officeModelScreenFromJson(String str) => OfficeModelScreen.fromJson(json.decode(str));

String officeModelScreenToJson(OfficeModelScreen data) => json.encode(data.toJson());

class OfficeModelScreen {
    OfficeModelScreen({
        this.message,
        this.data,
    });

    String? message;
    Map<String, List<OfficeHeadingModel>>? data;

    factory OfficeModelScreen.fromJson(Map<String, dynamic> json) => OfficeModelScreen(
        message: json["message"],
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, List<OfficeHeadingModel>>(k, List<OfficeHeadingModel>.from(v.map((x) => OfficeHeadingModel.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class OfficeHeadingModel {
    OfficeHeadingModel({
        this.id,
        this.profile,
        this.name,
        this.designation,
        this.office,
        this.phone,
        this.email,
    });

    int? id;
    String? profile;
    Designation? name;
    Designation? designation;
    Designation? office;
    String? phone;
    String? email;

    factory OfficeHeadingModel.fromJson(Map<String, dynamic> json) => OfficeHeadingModel(
        id: json["id"],
        profile: json["profile"],
        name: Designation.fromJson(json["name"]),
        designation: Designation.fromJson(json["designation"]),
        office: Designation.fromJson(json["office"]),
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile": profile,
        "name": name!.toJson(),
        "designation": designation!.toJson(),
        "office": office!.toJson(),
        "phone": phone,
        "email": email,
    };
}

class Designation {
    Designation({
        this.en,
        this.np,
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
