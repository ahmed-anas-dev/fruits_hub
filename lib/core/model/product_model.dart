
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/core/model/review_model.dart';


class ProductModel {
  String name;
  String description;
  num price;
  final num sellingCount;
  String code;
  String? imageurl;
  bool isFeatured;
   final num expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating=0;
  final num ratingCount=0;
  final List<ReviewModel>reviews;

  ProductModel({
    required this.reviews,
    required this.name,
    required this.description,
    required this.price,
    required this.sellingCount,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.code,
   required this.isFeatured,
   this.imageurl
  });
   factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      code: json['code'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageurl: json['imageurl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isFeatured: json['isFeatured'],
      reviews: json['reviews']!=null?List<ReviewModel>.from(json['reviews']
      .map((x) => ReviewModel.fromJson(x))):[],
       sellingCount: json['sellingCount'],
    );
  }
  toJson() {
    return {
      "reviews": reviews.map((e) => e.toJson()).toList(),
      "name": name,
      "description": description,
      "price": price,
      "code": code,
      "isFeatured": isFeatured,
      "imageurl": imageurl,
      "expirationsMonths": expirationsMonths,
      "isOrganic": isOrganic,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount
     
    };
  }
  ProductEntity toEntity() {
    return ProductEntity(
      code: code,
      name: name,
      description: description,
      price: price,
      imageurl: imageurl,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }
}