// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
  Events({
    this.data,
  });

  List<EventsData>? data;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        data: List<EventsData>.from(
            json["data"].map((x) => EventsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EventsData {
  EventsData({
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

  factory EventsData.fromJson(Map<String, dynamic> json) => EventsData(
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
