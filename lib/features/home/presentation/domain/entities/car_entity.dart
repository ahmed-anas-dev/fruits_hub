import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/cart_item_entites.dart';

class CarEntity extends Equatable {
  final List<CartItemEntites> cartItems;

  CarEntity(this.cartItems);
  addCartItem(CartItemEntites cartItemEntites) {
    cartItems.add(cartItemEntites);
  }
  deleteCartItem(CartItemEntites cartItemEntites) {
    cartItems.remove(cartItemEntites);
  }
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.totalPrice();
    }
    return totalPrice;
  }


  bool isExis(ProductEntity product) {
    for (var item in cartItems) {
      if (item.product == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntites getCartItem(ProductEntity product) {
    for (var item in cartItems) {
      if (item.product == product) {
        return item;
      }
    }
    return CartItemEntites(product: product, count: 1);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [cartItems];

}
