// To parse this JSON data, do
//
//     final onlineServiceModel = onlineServiceModelFromJson(jsonString);

import 'dart:convert';

OnlineServiceModel onlineServiceModelFromJson(String str) => OnlineServiceModel.fromJson(json.decode(str));

String onlineServiceModelToJson(OnlineServiceModel data) => json.encode(data.toJson());

class OnlineServiceModel {
    OnlineServiceModel({
        required this.message,
        required this.data,
    });

    String? message;
    List<OnlineServiceHeadingModel>? data;

    factory OnlineServiceModel.fromJson(Map<String, dynamic> json) => OnlineServiceModel(
        message: json["message"],
        data: List<OnlineServiceHeadingModel>.from(json["data"].map((x) => OnlineServiceHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class OnlineServiceHeadingModel {
    OnlineServiceHeadingModel({
        required this.id,
        required this.information,
        this.slug,
    });

    int? id;
    Information? information;
    dynamic slug;

    factory OnlineServiceHeadingModel.fromJson(Map<String, dynamic> json) => OnlineServiceHeadingModel(
        id: json["id"],
        information: Information.fromJson(json["information"]),
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "information": information!.toJson(),
        "slug": slug,
    };
}

class Information {
    Information({
         this.en,
         this.np,
    });

    String? en;
    String? np;

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
