import 'package:fruits_hub/features/home/presentation/domain/entities/cart_item_entites.dart';

class OrderProductModel {
  final String code;
  final String imageurl;
  final String name;
  final String price;
  final String quantity;
  OrderProductModel({
    required this.code,
    required this.imageurl,
    required this.name,
    required this.price,
    required this.quantity,
  });
  factory OrderProductModel.fromEntity({required CartItemEntites cartItemEntites}) {
    return OrderProductModel(
      code: cartItemEntites.product.code,
      imageurl: cartItemEntites.product.imageurl!,
      name: cartItemEntites.product.name,
      price: cartItemEntites.product.price.toString(),
      quantity: cartItemEntites.count.toString(),
    );
  }
  toJson() => {
        "code": code,
        "imageurl": imageurl,
        "name": name,
        "price": price,
        "quantity": quantity,
      };
}
