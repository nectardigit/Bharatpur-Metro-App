// To parse this JSON data, do
//
//     final intro = introFromJson(jsonString);

import 'dart:convert';

Intro introFromJson(String str) => Intro.fromJson(json.decode(str));

String introToJson(Intro data) => json.encode(data.toJson());

class Intro {
  Intro({
    this.message,
    this.data,
  });

  String? message;
  List<IntroData>? data;

  factory Intro.fromJson(Map<String, dynamic> json) => Intro(
        message: json["message"],
        data: List<IntroData>.from(
            json["data"].map((x) => IntroData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class IntroData {
  IntroData({
    this.description,
    this.link,
    this.phone,
    this.id,
  });

  Description? description;

  String? link;
  dynamic phone;
  int? id;
  factory IntroData.fromJson(Map<String, dynamic> json) => IntroData(
        description: Description.fromJson(json["description"]),
        link: json['link'],
        phone: json['phone'],
        id: json['id']
      );

  Map<String, dynamic> toJson() => {
        "description": description!.toJson(),
        "link": link,
        "phone": phone,
        "id": id,
      };
}

class Description {
  Description({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
