import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key,required this.text,required this.index});
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 13.5,
          backgroundColor: const Color(0xFFF2F3F3) /* 50 */,

          child: Text(
            index,
            style: AppTextStyles.bold13600.copyWith(
              color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            ),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bold13600.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
