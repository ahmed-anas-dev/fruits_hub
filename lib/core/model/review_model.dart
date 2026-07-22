import 'package:fruits_hub/core/entity/review_entity.dart' show ReviewEntity;

class ReviewModel {
  final String image;
  final String name;
  final String reviewDescription;
  final String rating;
  final int data;

  ReviewModel({
    required this.image,
    required this.name,
    required this.reviewDescription,
    required this.rating,
    required this.data,
  });
  factory ReviewModel.fromEntity(ReviewEntity map) {
    return ReviewModel(
      image: map.image,
      name: map.name,
      reviewDescription: map.reviewDescription,
      rating: map.rating,
      data: map.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      reviewDescription: json['reviewDescription'] ?? "",
      rating: json['rating'] ?? "",
      data: json['date'] ?? 0,
    );
  }
  toJson() {
    return {
      "image": image,
      "name": name,
      "reviewDescription": reviewDescription,
      "rating": rating,
      "date": data,
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      image: image,
      name: name,
      reviewDescription: reviewDescription,
      rating: rating,
      date: data,
    );
  }
}
