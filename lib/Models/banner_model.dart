// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Banner> bannerFromJson(String str) =>
    List<Banner>.from(json.decode(str).map((x) => Banner.fromJson(x)));

String bannerToJson(List<Banner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Banner {
  Banner({
    required this.type,
    required this.banner1,
    required this.banner2,
    required this.banner3,
  });

  String type;
  String banner1;
  String banner2;
  String banner3;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        type: json["type"],
        banner1: json["banner1"],
        banner2: json["banner2"],
        banner3: json["banner3"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "banner1": banner1,
        "banner2": banner2,
        "banner3": banner3,
      };
}
