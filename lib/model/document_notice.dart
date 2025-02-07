// To parse this JSON data, do
//
//     final doucmentNoticeModel = doucmentNoticeModelFromJson(jsonString);

import 'dart:convert';

DoucmentNoticeModel doucmentNoticeModelFromJson(String str) =>
    DoucmentNoticeModel.fromJson(json.decode(str));

String doucmentNoticeModelToJson(DoucmentNoticeModel data) =>
    json.encode(data.toJson());

class DoucmentNoticeModel {
  DoucmentNoticeModel({
    this.message,
    this.data,
  });

  String? message;
  List<NoticeHeadingModel>? data;

  factory DoucmentNoticeModel.fromJson(Map<String, dynamic> json) =>
      DoucmentNoticeModel(
        message: json["message"],
        data: List<NoticeHeadingModel>.from(
            json["data"].map((x) => NoticeHeadingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NoticeHeadingModel {
  int? id;
  Title? title;
  Null? details;
  String? files;
  String? createdAt;

  NoticeHeadingModel({this.id, this.title, this.details, this.files, this.createdAt});

  NoticeHeadingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    details = json['details'];
    files = json['files'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['details'] = this.details;
    data['files'] = this.files;
    data['created_at'] = this.createdAt;
    return data;
  }
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
