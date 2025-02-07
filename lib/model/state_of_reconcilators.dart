// To parse this JSON data, do
//
//     final stateReconciliatorsModel = stateReconciliatorsModelFromJson(jsonString);

import 'dart:convert';

StateReconciliatorsModel stateReconciliatorsModelFromJson(String str) => StateReconciliatorsModel.fromJson(json.decode(str));

String stateReconciliatorsModelToJson(StateReconciliatorsModel data) => json.encode(data.toJson());

class StateReconciliatorsModel {
    StateReconciliatorsModel({
        this.message,
        this.data,
    });

    String? message;
    List<StateReconciliatorHeaderModel>? data;

    factory StateReconciliatorsModel.fromJson(Map<String, dynamic> json) => StateReconciliatorsModel(
        message: json["message"],
        data: List<StateReconciliatorHeaderModel>.from(json["data"].map((x) => StateReconciliatorHeaderModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class StateReconciliatorHeaderModel {
    StateReconciliatorHeaderModel({
        this.id,
        this.name,
        this.details,
        this.date,
        this.ward,
        this.wards,
    });

    int? id;
    Details? name;
    Details? details;
    dynamic date;
    dynamic ward;
    dynamic wards;

    factory StateReconciliatorHeaderModel.fromJson(Map<String, dynamic> json) => StateReconciliatorHeaderModel(
        id: json["id"],
        name: Details.fromJson(json["name"]),
        details: Details.fromJson(json["details"]),
        date: json["date"],
        ward: json["ward"],
        wards: json["wards"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name!.toJson(),
        "details": details!.toJson(),
        "date": date,
        "ward": ward,
        "wards": wards,
    };
}

class Details {
    Details({
        this.en,
        this.np,
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
