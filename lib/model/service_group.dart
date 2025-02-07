// To parse this JSON data, do
//
//     final serviceGroupModel = serviceGroupModelFromJson(jsonString);

import 'dart:convert';

ServiceGroupModel serviceGroupModelFromJson(String str) => ServiceGroupModel.fromJson(json.decode(str));

String serviceGroupModelToJson(ServiceGroupModel data) => json.encode(data.toJson());

class ServiceGroupModel {
    ServiceGroupModel({
        this.message,
        this.data,
    });

    String? message;
    List<ServiceGroupHeadingModel>? data;

    factory ServiceGroupModel.fromJson(Map<String, dynamic> json) => ServiceGroupModel(
        message: json["message"],
        data: List<ServiceGroupHeadingModel>.from(json["data"].map((x) => ServiceGroupHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ServiceGroupHeadingModel {
    ServiceGroupHeadingModel({
        this.id,
        this.title,
        this.ofice,
    });

    int? id;
    Ofice? title;
    Ofice? ofice;

    factory ServiceGroupHeadingModel.fromJson(Map<String, dynamic> json) => ServiceGroupHeadingModel(
        id: json["id"],
        title: Ofice.fromJson(json["title"]),
        ofice: Ofice.fromJson(json["ofice"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "ofice": ofice!.toJson(),
    };
}

class Ofice {
    Ofice({
        this.en,
        this.np,
    });

    String? en;
    String? np;

    factory Ofice.fromJson(Map<String, dynamic> json) => Ofice(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
