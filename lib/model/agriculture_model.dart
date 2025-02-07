// To parse this JSON data, do
//
//     final agricultureModel = agricultureModelFromJson(jsonString);

import 'dart:convert';

AgricultureModel agricultureModelFromJson(String str) => AgricultureModel.fromJson(json.decode(str));

String agricultureModelToJson(AgricultureModel data) => json.encode(data.toJson());

class AgricultureModel {
    AgricultureModel({
        required this.message,
        required this.data,
    });

    String message;
    List<AgricultureData> data;

    factory AgricultureModel.fromJson(Map<String, dynamic> json) => AgricultureModel(
        message: json["message"],
        data: List<AgricultureData>.from(json["data"].map((x) => AgricultureData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class AgricultureData {
    AgricultureData({
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

    factory AgricultureData.fromJson(Map<String, dynamic> json) => AgricultureData(
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
