// To parse this JSON data, do
//
//     final noticeModel = noticeModelFromJson(jsonString);

import 'dart:convert';

NoticeModel noticeModelFromJson(String str) => NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

class NoticeModel {
    NoticeModel({
        required this.message,
        required this.data,
    });

    String? message;
    List<NoticeData>? data;

    factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
        message: json["message"],
        data: List<NoticeData>.from(json["data"].map((x) => NoticeData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class NoticeData {
    NoticeData({
        required this.title,
        required this.details,
        required this.files,
        required this.status,
    });

    Details? title;
    Details? details;
    String? files;
    int? status;

    factory NoticeData.fromJson(Map<String, dynamic> json) => NoticeData(
        title: Details.fromJson(json["title"]),
        details: Details.fromJson(json["details"]),
        files: json["files"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "title": title!.toJson(),
        "details": details!.toJson(),
        "files": files,
        "status": status,
    };
}

class Details {
    Details({
        required this.en,
        required this.np,
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
