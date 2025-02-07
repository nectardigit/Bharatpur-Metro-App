// // To parse this JSON data, do
// //
// //     final planCategoryModel = planCategoryModelFromJson(jsonString);

// import 'dart:convert';

// PlanCategoryModel planCategoryModelFromJson(String str) => PlanCategoryModel.fromJson(json.decode(str));

// String planCategoryModelToJson(PlanCategoryModel data) => json.encode(data.toJson());

// class PlanCategoryModel {
//     PlanCategoryModel({
//          this.message,
//          this.documentCategory,
//          this.subDocumentCategory,
//          this.data,
//     });

//     String? message;
//     String? documentCategory;
//     String? subDocumentCategory;
//     List<Datum>? data;

//     factory PlanCategoryModel.fromJson(Map<String, dynamic> json) => PlanCategoryModel(
//         message: json["message"],
//         documentCategory: json["document_category"],
//         subDocumentCategory: json["sub-document_category"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "document_category": documentCategory,
//         "sub-document_category": subDocumentCategory,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//          this.id,
//          this.title,
//          this.docCategory,
//     });

//     int? id;
//     Title? title;
//     String? docCategory;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         title: Title.fromJson(json["title"]),
//         docCategory: json["doc_category"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title!.toJson(),
//         "doc_category": docCategory,
//     };
// }

// class Title {
//     Title({
//          this.en,
//         this.np,
//     });

//     String? en;
//     String? np;

//     factory Title.fromJson(Map<String, dynamic> json) => Title(
//         en: json["en"],
//         np: json["np"],
//     );

//     Map<String, dynamic> toJson() => {
//         "en": en,
//         "np": np,
//     };
// }
