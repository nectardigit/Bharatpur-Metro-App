// To parse this JSON data, do
//
//     final officeTypeModel = officeTypeModelFromJson(jsonString);

import 'dart:convert';

OfficeTypeModel officeTypeModelFromJson(String str) => OfficeTypeModel.fromJson(json.decode(str));

String officeTypeModelToJson(OfficeTypeModel data) => json.encode(data.toJson());

class OfficeTypeModel {
    OfficeTypeModel({
        this.message,
        this.data,
    });

    String? message;
    List<OfficeTypeHeadingModel>? data;

    factory OfficeTypeModel.fromJson(Map<String, dynamic> json) => OfficeTypeModel(
        message: json["message"],
        data: List<OfficeTypeHeadingModel>.from(json["data"].map((x) => OfficeTypeHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class OfficeTypeHeadingModel {
    OfficeTypeHeadingModel({
        this.id,
        this.title,
    });

    int? id;
    Title? title;

    factory OfficeTypeHeadingModel.fromJson(Map<String, dynamic> json) => OfficeTypeHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
    };
}

class Title {
    Title({
        this.en,
        this.np,
    });

    String? en;
    String? np;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
