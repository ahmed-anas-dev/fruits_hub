
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entity/review_entity.dart' show ReviewEntity;


class ProductEntity extends Equatable {
   String name;
  String description;
  num price;
  String code;
  String? imageurl;
  bool isFeatured;
  final num expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating=0;
  final num ratingCount=0;
  final List<ReviewEntity>reviews;

  ProductEntity({
    required this.reviews,
    required this.unitAmount,
    required this.name,
    required this.description,
    required this.price,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.code,
    required this.isFeatured,
    this.imageurl,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [code];


}
