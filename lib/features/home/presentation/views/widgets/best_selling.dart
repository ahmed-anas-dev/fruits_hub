import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/bestselling/presentation/views/best_selling_views.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context, BestSellingViews.routeName);
      },
      child: Row(
        children: [
         
          Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: AppTextStyles.bold16700.copyWith(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
      
            ),
          ),
          Spacer(),
           Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold40013.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ],
      ),
    );
  }
}
