import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/bestselling/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingViews extends StatelessWidget {
  const BestSellingViews({super.key});

  static const String routeName = "BestSellingViews";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context,name: "الأكثر مبيعًا"),
      body: BestSellingViewBody(),
    );
    }  }

  
