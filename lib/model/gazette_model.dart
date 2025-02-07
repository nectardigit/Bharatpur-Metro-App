// To parse this JSON data, do
//
//     final gazetteModal = gazetteModalFromJson(jsonString);

import 'dart:convert';

GazetteModal gazetteModalFromJson(String str) => GazetteModal.fromJson(json.decode(str));

String gazetteModalToJson(GazetteModal data) => json.encode(data.toJson());

class GazetteModal {
    GazetteModal({
        this.message,
        this.data,
    });

    String? message;
    List<GazetteHeadingModel>? data;

    factory GazetteModal.fromJson(Map<String, dynamic> json) => GazetteModal(
        message: json["message"],
        data: List<GazetteHeadingModel>.from(json["data"].map((x) => GazetteHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GazetteHeadingModel {
    GazetteHeadingModel({
        this.id,
        this.title,
        this.sectionGazette,
        this.fiscalYear,
        this.files,
        this.publishedDate,
    });

    int? id;
    Title? title;
    String? sectionGazette;
    dynamic fiscalYear;
    String? files;
    String? publishedDate;

    factory GazetteHeadingModel.fromJson(Map<String, dynamic> json) => GazetteHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        sectionGazette:json["section_gazette"],
        fiscalYear: json["fiscal_year"],
        files: json["files"],
        publishedDate: json["published_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "section_gazette": sectionGazette,
        "fiscal_year": fiscalYear,
        "files": files,
        "published_date": publishedDate,
    };
}

// enum SectionGazette { SURYODAYA_RAJPATRA_KHANDA_1, SURYODAYA_RAJPATRA_KHANDA_2, SURYODAYA_RAJPATRA_KHANDA_3, SURYODAYA_RAJPATRA_KHANDA_4, SURYODAYA_RAJPATRA_KHANDA_5, SURYODAYA_RAJPATRA_KHANDA_6 }

// final sectionGazetteValues = EnumValues({
//     "Suryodaya Rajpatra Khanda 1": SectionGazette.SURYODAYA_RAJPATRA_KHANDA_1,
//     "Suryodaya Rajpatra Khanda 2": SectionGazette.SURYODAYA_RAJPATRA_KHANDA_2,
//     "Suryodaya Rajpatra Khanda 3": SectionGazette.SURYODAYA_RAJPATRA_KHANDA_3,
//     "Suryodaya Rajpatra Khanda 4": SectionGazette.SURYODAYA_RAJPATRA_KHANDA_4,
//     "Suryodaya Rajpatra Khanda 5": SectionGazette.SURYODAYA_RAJPATRA_KHANDA_5,
//     "Suryodaya Rajpatra Khanda 6": SectionGazette.SURYODAYA_RAJPATRA_KHANDA_6
// });

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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
