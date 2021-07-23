// To parse this JSON data, do
//
//     final ratingModel = ratingModelFromJson(jsonString);

import 'dart:convert';

List<RatingModel> ratingModelFromJson(String str) => List<RatingModel>.from(
    json.decode(str).map((x) => RatingModel.fromJson(x)));

String ratingModelToJson(List<RatingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RatingModel {
  RatingModel({
    required this.id,
    required this.userName,
    required this.foodId,
    required this.comment,
    required this.rating,
  });

  String id;
  String userName;
  int foodId;
  String comment;
  int rating;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json["id"],
        userName: json["userName"],
        foodId: json["foodId"],
        comment: json["comment"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "foodId": foodId,
        "comment": comment,
        "rating": rating,
      };
}
