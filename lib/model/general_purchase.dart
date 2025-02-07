// To parse this JSON data, do
//
//     final generalServiceModel = generalServiceModelFromJson(jsonString);

import 'dart:convert';

GeneralServiceModel generalServiceModelFromJson(String str) => GeneralServiceModel.fromJson(json.decode(str));

String generalServiceModelToJson(GeneralServiceModel data) => json.encode(data.toJson());

class GeneralServiceModel {
    GeneralServiceModel({
        this.message,
        this.data,
    });

    String? message;
    List<GeneralServiceHeadingModel>? data;

    factory GeneralServiceModel.fromJson(Map<String, dynamic> json) => GeneralServiceModel(
        message: json["message"],
        data: List<GeneralServiceHeadingModel>.from(json["data"].map((x) => GeneralServiceHeadingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GeneralServiceHeadingModel {
    GeneralServiceHeadingModel({
        this.id,
        this.title,
        this.documentGroup,
        this.documentSubGroup,
        this.lawType,
        this.lawLevel,
        this.lawField,
        this.sectionGazette,
        this.fiscalYear,
        this.duration,
        this.published,
        this.files,
        this.tag1,
        this.tag2,
        this.tag3,
        this.createdAt,
        this.updatedAt,
        this.status,
    });

    int? id;
    Title? title;
    String? documentGroup;
    dynamic documentSubGroup;
    dynamic lawType;
    dynamic lawLevel;
    dynamic lawField;
    dynamic sectionGazette;
    dynamic fiscalYear;
    dynamic duration;
    String? published;
    String? files;
    List<String>? tag1;
    dynamic tag2;
    dynamic tag3;
    String? createdAt;
    String? updatedAt;
    int? status;

    factory GeneralServiceHeadingModel.fromJson(Map<String, dynamic> json) => GeneralServiceHeadingModel(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        documentGroup: json["document_group"],
        documentSubGroup: json["document_sub_group"],
        lawType: json["law_type"],
        lawLevel: json["law_level"],
        lawField: json["law_field"],
        sectionGazette: json["section_gazette"],
        fiscalYear: json["fiscal_year"],
        duration: json["duration"],
        published: json["published"],
        files: json["files"],
        tag1: List<String>.from(json["tag_1"].map((x) => x)),
        tag2: json["tag_2"],
        tag3: json["tag_3"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "document_group": documentGroup,
        "document_sub_group": documentSubGroup,
        "law_type": lawType,
        "law_level": lawLevel,
        "law_field": lawField,
        "section_gazette": sectionGazette,
        "fiscal_year": fiscalYear,
        "duration": duration,
        "published": published,
        "files": files,
        "tag_1": List<dynamic>.from(tag1!.map((x) => x)),
        "tag_2": tag2,
        "tag_3": tag3,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status,
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
