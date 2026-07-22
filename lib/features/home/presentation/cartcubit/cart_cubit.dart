import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_state.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/car_entity.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/cart_item_entites.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
CarEntity ss=CarEntity([]);
  void addProduct(ProductEntity item) {

    bool isExis=ss.isExis(item);
    var caritem=ss.getCartItem(item);
    if(isExis){
      caritem.increaseCount();

    }else{
      ss.addCartItem(caritem);
    }
    emit(CartAdded());
  }
  void removeProduct(CartItemEntites item) {
    ss.deleteCartItem(item);
    emit(CartRemoved());
  }
  void fresh (){
    print("fresh");
    emit(CartUbdate());
  }

  
  
}