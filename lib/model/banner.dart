// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
     this.message,
     this.data,
  });

  String? message;
  List<BannerData>? data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        message: json["message"],
        data: List<BannerData>.from(json["data"].map((x) => BannerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BannerData {
  BannerData({
    required this.bannerTitle,
    required this.image,
    required this.status,
  });

  BannerTitle? bannerTitle;
  String? image;
  int? status;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        bannerTitle: BannerTitle.fromJson(json["banner_title"]),
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "banner_title": bannerTitle!.toJson(),
        "image": image,
        "status": status,
      };
}

class BannerTitle {
  BannerTitle({
    required this.en,
    required this.np,
  });

  String? en;
  String? np;

  factory BannerTitle.fromJson(Map<String, dynamic> json) => BannerTitle(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
