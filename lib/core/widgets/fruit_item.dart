import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entity/product_entity.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 18),
              product.imageurl != null
                  ? Image.network(
                      product.imageurl!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Container(width: 100, height: 100, color: Colors.red),

              ListTile(
                title: Text(
                  product.name,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.bold13600.copyWith(
                    color: const Color(0xFF0C0D0D),

                    /* Grayscale-950 */
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: product.price.toString(),
                        style: AppTextStyles.bold13700.copyWith(
                          color: const Color(0xFFF4A91F) /* Orange-500 */,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: AppTextStyles.bold13700.copyWith(
                          color: const Color(0xFFF8C76D) /* Orange-300 */,
                        ),
                      ),
                      TextSpan(
                        text: ' الكيلو',
                        style: AppTextStyles.bold13600.copyWith(
                          color: const Color(0xFFF8C76D) /* Orange-300 */,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addProduct(product);
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.primaryColors,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
