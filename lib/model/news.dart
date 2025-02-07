// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

NewsModel newsFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.data,
  });

  List<NewsData>? data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        data:
            List<NewsData>.from(json["data"].map((x) => NewsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NewsData {
  NewsData({
    this.date,
    this.image,
    this.title,
    this.description,
    this.slug,
    this.status,
  });

  String? date;
  String? image;
  Description? title;
  Description? description;
  String? slug;
  int? status;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        date: json["date"],
        image: json["image"],
        title: Description.fromJson(json["title"]),
        description: Description.fromJson(json["description"]),
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "image": image,
        "title": title?.toJson(),
        "description": description?.toJson(),
        "slug": slug,
        "status": status,
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
