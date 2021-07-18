// To parse this JSON data, do
//
//     final orderItems = orderItemsFromJson(jsonString);

import 'dart:convert';

List<OrderItems> orderItemsFromJson(String str) =>
    List<OrderItems>.from(json.decode(str).map((x) => OrderItems.fromJson(x)));

String orderItemsToJson(List<OrderItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderItems {
  OrderItems({
    required this.foodId,
    required this.quantity,
  });

  int foodId;
  int quantity;

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        foodId: json["foodId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "quantity": quantity,
      };
}
