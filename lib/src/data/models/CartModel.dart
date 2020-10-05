// To parse this JSON data, do
//
//     final subSectionsModel = subSectionsModelFromJson(jsonString);

import 'dart:convert';

CartModel subSectionsModelFromJson(String str) =>
    CartModel.fromJson(json.decode(str));

String subSectionsModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel(
      {this.id, this.name, this.image, this.price, this.disc, this.count});

  int id;
  int price;
  String name;
  String disc;
  String image;
  int count;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        name: json["Name"],
        image: json["Image"],
        price: json["price"],
        disc: json["disc"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Image": image,
        "price": price,
        "disc": disc,
        "count": count,
      };
}
