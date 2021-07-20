// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

List<OrderListModel> orderListFromJson(String str) => List<OrderListModel>.from(
    json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListToJson(List<OrderListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
  OrderListModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.tableId,
    required this.status,
    required this.total,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userId;
  int tableId;
  int status;
  String total;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        userId: json["userId"],
        tableId: json["tableId"],
        status: json["status"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "userId": userId,
        "tableId": tableId,
        "status": status,
        "total": total,
      };
}
