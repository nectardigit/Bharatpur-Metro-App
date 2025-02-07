// To parse this JSON data, do
//
//     final lawType = lawTypeFromJson(jsonString);

import 'dart:convert';

LawType lawTypeFromJson(String str) => LawType.fromJson(json.decode(str));

String lawTypeToJson(LawType data) => json.encode(data.toJson());

class LawType {
    LawType({
        this.message,
        this.data,
    });

    String? message;
    List<LawTypeHeading>? data;

    factory LawType.fromJson(Map<String, dynamic> json) => LawType(
        message: json["message"],
        data: List<LawTypeHeading>.from(json["data"].map((x) => LawTypeHeading.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class LawTypeHeading {
    LawTypeHeading({
        this.name,
        this.id,
    });

    Name? name;
    int? id;

    factory LawTypeHeading.fromJson(Map<String, dynamic> json) => LawTypeHeading(
        name: Name.fromJson(json["name"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name!.toJson(),
        "id": id,
    };
}

class Name {
    Name({
        this.en,
        this.np,
    });

    String? en;
    String? np;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        en: json["en"],
        np: json["np"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
    };
}
