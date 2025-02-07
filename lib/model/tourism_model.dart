// To parse this JSON data, do
//
//     final tourismModel = tourismModelFromJson(jsonString);

import 'dart:convert';

TourismModel tourismModelFromJson(String str) => TourismModel.fromJson(json.decode(str));

String tourismModelToJson(TourismModel data) => json.encode(data.toJson());

class TourismModel {
    TourismModel({
        required this.message,
        required this.data,
    });

    String message;
    List<TourismData> data;

    factory TourismModel.fromJson(Map<String, dynamic> json) => TourismModel(
        message: json["message"],
        data: List<TourismData>.from(json["data"].map((x) => TourismData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class TourismData {
    TourismData({
        required this.id,
        required this.title,
        required this.details,
        required this.files,
        required this.date,
        required this.status,
    });

    int id;
    Details title;
    Details details;
    String files;
    DateTime date;
    int status;

    factory TourismData.fromJson(Map<String, dynamic> json) => TourismData(
        id: json["id"],
        title: Details.fromJson(json["title"]),
        details: Details.fromJson(json["details"]),
        files: json["files"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "details": details.toJson(),
        "files": files,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": status,
    };
}

class Details {
    Details({
        required this.en,
        required this.np,
    });

    String en;
    String np;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
