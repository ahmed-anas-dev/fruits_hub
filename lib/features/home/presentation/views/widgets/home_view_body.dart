import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/prosuctscubit/products_cubit.dart'
    show ProductsCubit;
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart'
    show BestSellingGridViewBlocBuilder;
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list.dart'
    show FeaturedList;

import 'best_selling.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),

                SizedBox(height: 16),
                FeaturedList(),
                SizedBox(height: 12),
                BestSelling(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
