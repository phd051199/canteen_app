// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:food_order/models/food.dart';
import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.foodId,
    required this.quantity,
    required this.food,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userId;
  int foodId;
  int quantity;
  Food food;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["userId"],
        foodId: json["foodId"],
        quantity: json["quantity"],
        food: Food.fromJson(json["food"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "userId": userId,
        "foodId": foodId,
        "quantity": quantity,
        "food": food.toJson(),
      };
}
