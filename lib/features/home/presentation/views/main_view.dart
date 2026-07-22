import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_views.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: 
         CustomBottomNavigationBar(),
      
    );
  }
}
