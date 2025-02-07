// To parse this JSON data, do
//
//     final budgetDocumentModel = budgetDocumentModelFromJson(jsonString);

import 'dart:convert';

BudgetDocumentModel budgetDocumentModelFromJson(String str) => BudgetDocumentModel.fromJson(json.decode(str));

String budgetDocumentModelToJson(BudgetDocumentModel data) => json.encode(data.toJson());

class BudgetDocumentModel {
    BudgetDocumentModel({
        required this.message,
        required this.data,
    });

    String message;
    List<BudgetDocumentData> data;

    factory BudgetDocumentModel.fromJson(Map<String, dynamic> json) => BudgetDocumentModel(
        message: json["message"],
        data: List<BudgetDocumentData>.from(json["data"].map((x) => BudgetDocumentData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BudgetDocumentData {
    BudgetDocumentData({
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

    factory BudgetDocumentData.fromJson(Map<String, dynamic> json) => BudgetDocumentData(
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
