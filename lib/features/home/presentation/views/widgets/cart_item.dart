import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/cart_item_entites.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntites});
  final CartItemEntites cartItemEntites;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    print("dataaaaaaa${widget.cartItemEntites.product.name}");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            color: const Color(0xFFEBF9F1),
            width: 73,
            height: 92,
            child: Image.network(widget.cartItemEntites.product.imageurl!),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.cartItemEntites.product.name,
                      style: AppTextStyles.bold13700.copyWith(
                        color: const Color(0xFF05161B),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeProduct(
                          widget.cartItemEntites,
                          
                          
                        );
                      },
                      child: Icon(Icons.delete, color: AppColors.primaryColors),
                      // SvgPicture.asset("assets/images/delete.svg"),
                    ),
                  ],
                ),
                Text(
                  "${widget.cartItemEntites.totalWeight()} كم",
                  style: AppTextStyles.bold40013.copyWith(
                    color: const Color(0xFFF4A91F) /* Orange-500 */,
                  ),
                ),
                Row(
                  children: [
                    AddIconAndDelete(
                      callback: () {
                        setState(() {
                          widget.cartItemEntites.count++;
                        });
                        context.read<CartCubit>().fresh();
                        
                      },
                      icon: Icons.add,
                      color: AppColors.primaryColors,
                      iconColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "${widget.cartItemEntites.count}",
                        style: AppTextStyles.bold16700.copyWith(
                          color: const Color(0xFF05161B),
                        ),
                      ),
                    ),
                    AddIconAndDelete(
                      callback: () {
                        setState(() {
                          if (widget.cartItemEntites.count > 0) {
                            widget.cartItemEntites.count--;
                          }
                        });
                                                context.read<CartCubit>().fresh();

                      },
                      icon: Icons.remove,
                      color: const Color(0xFFF3F5F7),

                      iconColor: const Color(0xFF969899),
                    ),
                    Spacer(),
                    Text(
                      "${widget.cartItemEntites.totalPrice()} جنيه",
                      style: AppTextStyles.bold16700.copyWith(
                        color: const Color(0xFFF4A91F) /* Orange-500 */,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddIconAndDelete extends StatelessWidget {
  const AddIconAndDelete({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.callback,
  });
  final IconData icon;
  final Color color;
  final Color iconColor;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: color /* Green1-500 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
