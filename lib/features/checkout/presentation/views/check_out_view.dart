import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/get_user.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_view_body.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/car_entity.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/cart_item_entites.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key,required this.cartItem});
   static const String routeName = 'checkout';
   final CarEntity cartItem; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        buildappbar(context, name: "الشحن",showNotification: false),
        
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Provider.value(
          value:OrderEntity(
            UID: GetUser()!.uid,

            cartItem,

            
          ),
          child: const CheckOutViewBody()),
      ),
    );
  }
}