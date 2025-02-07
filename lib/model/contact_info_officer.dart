import 'package:gandakimun/model/law_type.dart';
import 'package:gandakimun/model/phones.dart';

import 'dart:convert';

ContactInfoModel eventsFromJson(String str) =>
    ContactInfoModel.fromJson(json.decode(str));

String eventsToJson(ContactInfoModel data) => json.encode(data.toJson());

class ContactInfoModel {
  ContactInfoModel({
    this.data,
    this.message,
  });

  List<ContactHeadingInfoModel>? data;
  String? message;

  ContactInfoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    if (json['data'] != null) {
      data = <ContactHeadingInfoModel>[];
      json['data'].forEach((v) {
        data!.add(ContactHeadingInfoModel.fromJson(v));
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

class ContactHeadingInfoModel {
  Name? companyname;

  String? phone;
  String? email;
  String? fblink;
  String? ytlink;
  String? instalink;

  ContactHeadingInfoModel(
      {this.companyname,
      this.email,
      this.fblink,
      this.instalink,
      this.phone,
      this.ytlink});

  ContactHeadingInfoModel.fromJson(Map<String, dynamic> json) {
    companyname = json['company_name'] != null
        ? Name.fromJson(json['company_name'])
        : null;
    email = json['email'];
    fblink = json['fb_link'];
    instalink = json['instagram_link'];
    phone = json['phone'];
    ytlink = json['youtube_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companyname != null) {
      data['company_name'] = companyname!.toJson();
    }
    data['phone'] = phone;
    data['email'] = email;
    data['fb_link'] = fblink;
    data['youtube_link'] = ytlink;
    data['instagram_link'] = instalink;

    return data;
  }
}
