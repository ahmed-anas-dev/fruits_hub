import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/prosuctscubit/products_cubit.dart'
    show ProductsCubit;
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_header.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Scaffold(
          appBar:buildappbar(context, name: "المنتجات", showBackButton: false),
        
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
        
                      SearchTextField(),
                      SizedBox(height: 16),
                      ProductsViewHeader(productLength: context.read<ProductsCubit>().productlength),
                    ],
                  ),
                ),
                BestSellingGridViewBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
