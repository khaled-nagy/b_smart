// To parse this JSON data, do
//
//     final cityMenu = cityMenuFromJson(jsonString);

import 'dart:convert';

CouponModel couponFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  CouponModel(
      {this.id,
      this.title,
      this.desc,
      this.advantage,
      this.terms,
      this.rate,
      this.price,
      this.image,
      this.priceBeforeDiscount,
      this.discountPercentage,
      this.finalPrice,
      this.receivables,
      this.productOptions,
      this.isAdded});

  int id;
  String title;
  String desc;
  String advantage;
  String terms;
  String rate;
  String price;
  String image;
  String priceBeforeDiscount;
  String discountPercentage;
  String finalPrice;
  String receivables;
  int productOptions;
  bool isAdded;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        advantage: json["advantage"],
        terms: json["terms"],
        rate: json["rate"],
        price: json["price"],
        image: json["image"],
        priceBeforeDiscount: json["priceBeforeDiscount"],
        discountPercentage: json["discountPercentage"],
        finalPrice: json["finalPrice"],
        receivables: json["receivables"],
        productOptions: json["product_options"],
        isAdded: json["is_added"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "advantage": advantage,
        "terms": terms,
        "rate": rate,
        "price": price,
        "image": image,
        "priceBeforeDiscount": priceBeforeDiscount,
        "discountPercentage": discountPercentage,
        "receivables": receivables,
        "is_added": isAdded,
      };
}
