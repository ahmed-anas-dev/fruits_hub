import 'package:fruits_hub/features/checkout/data/model/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/model/shipping_addrees_model.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';

class OrderModel {
  final double price;
  final String uid;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String payment;

  OrderModel({
    required this.price,
    required this.uid,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.payment,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    price: orderEntity.carItem.calculateTotalPrice(),
    uid: orderEntity.UID,
    shippingAddressModel: ShippingAddressModel.fromEntity(orderEntity.address),
    orderProducts: orderEntity.carItem.cartItems
        .map((e) => OrderProductModel.fromEntity(cartItemEntites: e))
        .toList(),
    payment: orderEntity.payWithCache! ? "cash" : "online",
  );
  toJson() => {
    "price": price,
    "uid": uid,
    "shippingAddressModel": shippingAddressModel.toJson(),
    "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
    "payment": payment,
  };
}
