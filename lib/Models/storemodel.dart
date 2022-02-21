// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Store> storeFromJson(String str) =>
    List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  Store({
    required this.id,
    required this.dokanName,
    required this.dokanPic,
    required this.status,
    required this.dokanAddress,
    required this.sellerName,
    required this.number,
    required this.type,
    required this.distance,
  });

  String id;
  String dokanName;
  String dokanPic;
  String status;
  String dokanAddress;
  String sellerName;
  String number;
  String type;
  String distance;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        dokanName: json["dokan_name"],
        dokanPic: json["dokan_pic"],
        status: json["status"],
        dokanAddress: json["dokan_address"],
        sellerName: json["seller_name"],
        number: json["number"],
        type: json["type"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dokan_name": dokanName,
        "dokan_pic": dokanPic,
        "status": status,
        "dokan_address": dokanAddress,
        "seller_name": sellerName,
        "number": number,
        "type": type,
        "distance": distance,
      };
}
