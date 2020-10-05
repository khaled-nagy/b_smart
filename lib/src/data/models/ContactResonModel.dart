// To parse this JSON data, do
//
//     final subSectionsModel = subSectionsModelFromJson(jsonString);

import 'dart:convert';

ContactResonModel subSectionsModelFromJson(String str) =>
    ContactResonModel.fromJson(json.decode(str));

String subSectionsModelToJson(ContactResonModel data) =>
    json.encode(data.toJson());

class ContactResonModel {
  ContactResonModel({
    this.id,
    this.name,
    this.image,
  });

  String id;
  String name;
  String image;

  factory ContactResonModel.fromJson(Map<String, dynamic> json) =>
      ContactResonModel(
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
