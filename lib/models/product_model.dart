// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.id,
    required this.brand,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    // required this.activated,
    this.quantity,
  });

  int id;
  String brand;
  String category;
  String name;
  String description;
  double price;
  int stock;
  int? quantity;
  String image;
  // bool activated = false;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    brand: json["brand"],
    category: json["category"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stock: json["stock"],
    image: json["image"],
    quantity: json["quantity"] ?? 0,
    // activated: json["activated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "category": category,
    "name": name,
    "description": description,
    "price": price.toDouble(),
    "stock": stock,
    "image": image,
    "quantity": quantity,
    // "activated": activated,
  };
}
