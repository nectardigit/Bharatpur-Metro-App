import 'package:gandakimun/model/law_type.dart';
import 'package:gandakimun/model/phones.dart';

import 'dart:convert';

ServiceCategoryModel eventsFromJson(String str) =>
    ServiceCategoryModel.fromJson(json.decode(str));

String eventsToJson(ServiceCategoryModel data) => json.encode(data.toJson());

class ServiceCategoryModel {
  ServiceCategoryModel({
    this.data,
    this.message,
  });

  List<ServiceCategoryHeadingModel>? data;
  String? message;

  ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['data'] != null) {
      data = <ServiceCategoryHeadingModel>[];
      json['data'].forEach((v) {
        data!.add(ServiceCategoryHeadingModel.fromJson(v));
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

class ServiceCategoryHeadingModel {
  Name? title;

  ServiceCategoryHeadingModel({
    this.title,
  });

  ServiceCategoryHeadingModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }

    return data;
  }
}
