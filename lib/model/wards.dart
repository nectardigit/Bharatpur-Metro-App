// To parse this JSON data, do
//
//     final wardModel = wardModelFromJson(jsonString);

import 'dart:convert';

WardModel wardModelFromJson(String str) => WardModel.fromJson(json.decode(str));

String wardModelToJson(WardModel data) => json.encode(data.toJson());

class WardModel {
    WardModel({
        this.message,
        this.data,
    });

    String? message;
    List<WardHeadingModel>? data;

    factory WardModel.fromJson(Map<String, dynamic> json) => WardModel(
        message: json["message"],
        data: List<WardHeadingModel>.from(json["data"].map((x) => WardHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class WardHeadingModel {
    WardHeadingModel({
        this.id,
        this.name,
        this.title,
        this.rank,
        this.details,
    });

    int? id;
    dynamic name;
    Details? title;
    dynamic rank;
    Details? details;

    factory WardHeadingModel.fromJson(Map<String, dynamic> json) => WardHeadingModel(
        id: json["id"],
        name: json["name"],
        title: Details.fromJson(json["title"]),
        rank: json["rank"],
        details: Details.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title!.toJson(),
        "rank": rank,
        "details": details!.toJson(),
    };
}

class Details {
    Details({
        this.en,
        this.np,
    });

    String? en;
    String? np;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}


class WardsData {
  Title? title;
  Title? description;
  int? status;

  WardsData({this.title, this.description, this.status});

  WardsData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Title {
  String? en;
  String? np;

  Title({this.en, this.np});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    np = json['np'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['np'] = np;
    return data;
  }
}
