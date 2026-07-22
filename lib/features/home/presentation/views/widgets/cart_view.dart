import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_state.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return  CartViewBody();
    });
  }
}