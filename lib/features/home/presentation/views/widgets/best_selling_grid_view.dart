import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  BestSellingGridView({super.key,required this.product});
  final List <ProductEntity> product;

  @override


  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: product.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163/214,
        
        crossAxisCount: 2), itemBuilder: (context, index) {
          return  FruitItem(
            product: product[index],
          
          );

    });
  }
}