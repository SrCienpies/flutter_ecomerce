// To parse this JSON data, do
//
//     final myBanner = myBannerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyBanner myBannerFromJson(String str) => MyBanner.fromJson(json.decode(str));

String myBannerToJson(MyBanner data) => json.encode(data.toJson());

class MyBanner {
  MyBanner({
    required this.id,
    required this.image,
    required this.description,
    required this.activated,
  });

  int id;
  String image;
  String description;
  bool activated;

  factory MyBanner.fromJson(Map<String, dynamic> json) => MyBanner(
    id: json["id"],
    image: json["image"],
    description: json["description"],
    activated: json["activated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "description": description,
    "activated": activated,
  };
}
