import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/prosuctscubit/products_cubit.dart';
import 'package:fruits_hub/core/repos/productsrepos/product_repos.dart';
import 'package:fruits_hub/core/services/get_it_services.dart' show getIt;
import 'package:fruits_hub/features/home/presentation/views/widgets/product_view_body.dart';

class ProductViews extends StatelessWidget {
  const ProductViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(productRepos: getIt.get<ProductRepos>()),
      child: const ProductViewBody(),
    );
  }
}