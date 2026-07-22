import 'package:fruits_hub/core/entity/product_entity.dart';

class CartItemEntites {
  final ProductEntity product;
  int count;

  CartItemEntites({required this.product, this.count = 0});
  num  totalPrice() => product.price * count;
  num totalWeight() => product.unitAmount * count;
  increaseCount() => count++;
  decreaseCount() => count--;
}