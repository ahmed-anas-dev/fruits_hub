import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class OnDivider extends StatelessWidget {
  const OnDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(width: 18,),
        Text(
          "أو",
          style: AppTextStyles.bold60016.copyWith(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
          ),
        ),
        SizedBox(width: 18,),
        Expanded(child: Divider()),
      ],
    );
  }
}
