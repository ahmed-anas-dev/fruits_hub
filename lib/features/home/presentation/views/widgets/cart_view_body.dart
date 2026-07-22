import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/views/check_out_view.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_state.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/cart_item_entites.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/devider_custom.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Scaffold(
          appBar: buildappbar(context, name: "السلة", showNotification: false),

          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 16),

                        SizedBox(height: 16),
                        CartHeader(),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: context.read<CartCubit>().ss.cartItems.isEmpty
                        ? DeviderCustom()
                        : SizedBox.shrink(),
                  ),
                  CartViewList(car: context.read<CartCubit>().ss.cartItems),
                  SliverToBoxAdapter(
                    child: context.read<CartCubit>().ss.cartItems.isEmpty
                        ? DeviderCustom()
                        : SizedBox.shrink(),
                  ),
                ],
              ),
              Positioned(
                left: 15,
                right: 15,
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      print("stateeeeeeeeee$state");
                      return CustomButton(
                        onPressed: () {
                          if (context
                              .read<CartCubit>()
                              .ss
                              .cartItems
                              .isNotEmpty) {
                            Navigator.pushNamed(
                              context,
                              CheckOutView.routeName,
                              arguments: context.read<CartCubit>().ss,
                            );
                          } else {
                            BeuildErrorBar(context, "لا يوجد منتجات في السلة");
                          }
                        },
                        text:
                            'الدفع ${context.read<CartCubit>().ss.calculateTotalPrice()} جنيه',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartViewList extends StatelessWidget {
  CartViewList({super.key, required this.car});
  final List<CartItemEntites> car;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) =>
          Divider(color: Colors.green, thickness: 1),
      itemBuilder: (context, index) {
        print(" index${car[index]}");

        return //SizedBox(height: 100,width: 100,child:Text("data"));
        CartItem(cartItemEntites: car[index]);
      },
      itemCount: car.length,
    );
  }
}
