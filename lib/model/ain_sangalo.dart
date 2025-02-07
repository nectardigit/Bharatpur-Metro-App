// To parse this JSON data, do
//
//     final ainSangaloData = ainSangaloDataFromJson(jsonString);

import 'dart:convert';

AinSangaloData ainSangaloDataFromJson(String str) => AinSangaloData.fromJson(json.decode(str));

String ainSangaloDataToJson(AinSangaloData data) => json.encode(data.toJson());

class AinSangaloData {
    AinSangaloData({
        this.message,
        this.documentCategory,
        this.subDocumentCategory,
        this.data,
    });

    String? message;
    String? documentCategory;
    String? subDocumentCategory;
    List<AniSangaloHeadingModel>? data;

    factory AinSangaloData.fromJson(Map<String, dynamic> json) => AinSangaloData(
        message: json["message"],
        documentCategory: json["document_category"],
        subDocumentCategory: json["sub-document_category"],
        data: List<AniSangaloHeadingModel>.from(json["data"].map((x) => AniSangaloHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "document_category": documentCategory,
        "sub-document_category": subDocumentCategory,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AniSangaloHeadingModel {
    AniSangaloHeadingModel({
        this.id,
        this.title,
        this.docCategory,
        this.files,
        this.date,
    });

    int? id;
    Title? title;
    String? docCategory;
    String? files;
    String? date;

    factory AniSangaloHeadingModel.fromJson(Map<String, dynamic> json) => AniSangaloHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        docCategory: json["doc_category"],
        files: json["files"],
        date:json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "doc_category": docCategory,
        "files": files,
        "date": date,
    };
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
