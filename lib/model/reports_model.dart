// To parse this JSON data, do
//
//     final reportModal = reportModalFromJson(jsonString);

import 'dart:convert';

ReportModal reportModalFromJson(String str) => ReportModal.fromJson(json.decode(str));

String reportModalToJson(ReportModal data) => json.encode(data.toJson());

class ReportModal {
    ReportModal({
        this.message,
        this.documentCategory,
        this.subDocumentCategory,
        this.data,
    });

    String? message;
    String? documentCategory;
    String? subDocumentCategory;
    List<ReportHeadingModel>? data;

    factory ReportModal.fromJson(Map<String, dynamic> json) => ReportModal(
        message: json["message"],
        documentCategory: json["document_category"],
        subDocumentCategory: json["sub-document_category"],
        data: List<ReportHeadingModel>.from(json["data"].map((x) => ReportHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "document_category": documentCategory,
        "sub-document_category": subDocumentCategory,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ReportHeadingModel {
    ReportHeadingModel({
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

    factory ReportHeadingModel.fromJson(Map<String, dynamic> json) => ReportHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        docCategory: json["doc_category"],
        files: json["files"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "doc_category": docCategory,
        "files": files,
        "date": date
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
