// To parse this JSON data, do
//
//     final listOfReconciliatorsModel = listOfReconciliatorsModelFromJson(jsonString);

import 'dart:convert';

ListOfReconciliatorsModel listOfReconciliatorsModelFromJson(String str) => ListOfReconciliatorsModel.fromJson(json.decode(str));

String listOfReconciliatorsModelToJson(ListOfReconciliatorsModel data) => json.encode(data.toJson());

class ListOfReconciliatorsModel {
    ListOfReconciliatorsModel({
        this.message,
        this.data,
    });

    String? message;
    List<ListOfReconciliatorHeaderModel>? data;

    factory ListOfReconciliatorsModel.fromJson(Map<String, dynamic> json) => ListOfReconciliatorsModel(
        message: json["message"],
        data: List<ListOfReconciliatorHeaderModel>.from(json["data"].map((x) => ListOfReconciliatorHeaderModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ListOfReconciliatorHeaderModel {
    ListOfReconciliatorHeaderModel({
        this.id,
        this.name,
        this.details,
        this.contact,
        this.wardId,
        this.wards,
        this.date,
        this.email,
        this.photo,
    });

    int? id;
    Contact? name;
    dynamic details;
    Contact? contact;
    dynamic wardId;
    dynamic wards;
    dynamic date;
    String? email;
    String? photo;

    factory ListOfReconciliatorHeaderModel.fromJson(Map<String, dynamic> json) => ListOfReconciliatorHeaderModel(
        id: json["id"],
        name: Contact.fromJson(json["name"]),
        details: json["details"],
        contact: Contact.fromJson(json["contact"]),
        wardId: json["ward_id"],
        wards: json["wards"],
        date: json["date"],
        email: json["email"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name!.toJson(),
        "details": details,
        "contact": contact!.toJson(),
        "ward_id": wardId,
        "wards": wards,
        "date": date,
        "email": email,
        "photo": photo,
    };
}

class Contact {
    Contact({
        this.en,
        this.np,
    });

    String? en;
    String? np;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
