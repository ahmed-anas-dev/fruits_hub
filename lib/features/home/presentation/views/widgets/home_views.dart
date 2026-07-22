import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/prosuctscubit/products_cubit.dart';
import 'package:fruits_hub/core/repos/productsrepos/product_repos.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';

import 'package:fruits_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(productRepos: getIt.get<ProductRepos>()),
      child: const HomeViewBody(),
    );
  }
}
