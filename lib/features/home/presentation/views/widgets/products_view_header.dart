import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key,required this.productLength});
  final int productLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       
        Text(
          '$productLength نتاءج',
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16700.copyWith(
                color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
    
          ),
        ),
        Spacer(),
        SvgPicture.asset("assets/images/filter2.svg"),
         
      ],
    );
  }
}
