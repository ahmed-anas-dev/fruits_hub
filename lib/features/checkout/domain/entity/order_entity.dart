import 'package:fruits_hub/features/checkout/domain/entity/adrees_entity.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/car_entity.dart';

class OrderEntity {
  final CarEntity carItem;
   bool? payWithCache;
   String UID;
   AdreesEntity address=AdreesEntity();

  OrderEntity(this.carItem, {this.payWithCache,required this.UID});
}
