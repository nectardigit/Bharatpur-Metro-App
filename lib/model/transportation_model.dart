// To parse this JSON data, do
//
//     final transportationModel = transportationModelFromJson(jsonString);

import 'dart:convert';

TransportationModel transportationModelFromJson(String str) => TransportationModel.fromJson(json.decode(str));

String transportationModelToJson(TransportationModel data) => json.encode(data.toJson());

class TransportationModel {
    TransportationModel({
        required this.message,
        required this.data,
    });

    String message;
    List<TransportationData> data;

    factory TransportationModel.fromJson(Map<String, dynamic> json) => TransportationModel(
        message: json["message"],
        data: List<TransportationData>.from(json["data"].map((x) => TransportationData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class TransportationData {
    TransportationData({
        required this.id,
        required this.title,
        required this.details,
        required this.files,
        required this.date,
        
    });

    int id;
    Details title;
    Details details;
    String files;
    DateTime date;
  

    factory TransportationData.fromJson(Map<String, dynamic> json) => TransportationData(
        id: json["id"],
        title: Details.fromJson(json["title"]),
        details: Details.fromJson(json["details"]),
        files: json["files"],
        date: DateTime.parse(json["date"]),
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "details": details.toJson(),
        "files": files,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      
    };
}

class Details {
    Details({
        required this.en,
        required this.np,
    });

    String en;
    String np;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
