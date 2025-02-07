import 'package:gandakimun/model/law_type.dart';


import 'dart:convert';

FooterTextModel eventsFromJson(String str) =>
    FooterTextModel.fromJson(json.decode(str));

String eventsToJson(FooterTextModel data) => json.encode(data.toJson());

class FooterTextModel {
  FooterTextModel({
    this.data,
    this.message,
  });

  List<FooterHeadingModel>? data;
  String? message;

  FooterTextModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['data'] != null) {
      data = <FooterHeadingModel>[];
      json['data'].forEach((v) {
        data!.add(FooterHeadingModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FooterHeadingModel {
  Name? details;
  int? id;
  Name? title;

  FooterHeadingModel({
    this.details,
    this.id,
    this.title,
  });

  FooterHeadingModel.fromJson(Map<String, dynamic> json) {
    details = json['details'] != null ? Name.fromJson(json['details']) : null;
    id = json['id'];

    title = json['title'] != null ? Name.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['id'] = id;

    if (details != null) {
      data['details'] = details!.toJson();
    }

    return data;
  }
}
