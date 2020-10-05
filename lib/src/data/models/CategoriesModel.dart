// To parse this JSON data, do
//
//     final subSectionsModel = subSectionsModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel subSectionsModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String subSectionsModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.id,
    this.name,
    this.image,
  });

  String id;
  String name;
  String image;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"],
        name: json["Name"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Image": image,
      };
}
