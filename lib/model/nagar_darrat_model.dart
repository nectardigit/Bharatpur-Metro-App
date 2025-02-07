// To parse this JSON data, do
//
//     final nagarDarratModel = nagarDarratModelFromJson(jsonString);

import 'dart:convert';

NagarDarratModel nagarDarratModelFromJson(String str) => NagarDarratModel.fromJson(json.decode(str));

String nagarDarratModelToJson(NagarDarratModel data) => json.encode(data.toJson());

class NagarDarratModel {
    NagarDarratModel({
        required this.message,
        required this.data,
    });

    String message;
    List<NagarDarratData> data;

    factory NagarDarratModel.fromJson(Map<String, dynamic> json) => NagarDarratModel(
        message: json["message"],
        data: List<NagarDarratData>.from(json["data"].map((x) => NagarDarratData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class NagarDarratData {
    NagarDarratData({
        required this.id,
        required this.title,
        required this.file,
        required this.date,
        required this.status,
    });

    int id;
    Title title;
    String file;
    DateTime date;
    int status;

    factory NagarDarratData.fromJson(Map<String, dynamic> json) => NagarDarratData(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        file: json["file"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "file": file,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": status,
    };
}

class Title {
    Title({
        required this.en,
        required this.np,
    });

    String en;
    String np;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
