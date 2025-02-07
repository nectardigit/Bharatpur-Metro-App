// To parse this JSON data, do
//
//     final reconciliationModel = reconciliationModelFromJson(jsonString);

import 'dart:convert';

ReconciliationModel reconciliationModelFromJson(String str) => ReconciliationModel.fromJson(json.decode(str));

String reconciliationModelToJson(ReconciliationModel data) => json.encode(data.toJson());

class ReconciliationModel {
    ReconciliationModel({
        required this.message,
        required this.data,
    });

    String message;
    List<ReconciliationData> data;

    factory ReconciliationModel.fromJson(Map<String, dynamic> json) => ReconciliationModel(
        message: json["message"],
        data: List<ReconciliationData>.from(json["data"].map((x) => ReconciliationData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ReconciliationData {
    ReconciliationData({
        required this.id,
        required this.name,
        required this.details,
        required this.date,
        required this.status,
    });

    int? id;
    Details ?name;
    Details? details;
    String? date;
    int? status;

    factory ReconciliationData.fromJson(Map<String, dynamic> json) => ReconciliationData(
        id: json["id"],
        name: Details.fromJson(json["name"]),
        details:  Details.fromJson(json["details"]),
        date: json["date"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name!.toJson(),
        "details": details!.toJson(),
        "date": date,
        "status": status,
    };
}

class Details {
    Details({
        required this.en,
        required this.np,
    });

    String? en;
    String? np;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        en:  json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
