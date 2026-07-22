import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key,required this.text});
 final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 13.5,
          backgroundColor: const Color(0xFF1B5E37) /* Green1-500 */,

          child: Icon(size: 20, Icons.check, color: Colors.white),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bold13700.copyWith(
            color: const Color(0xFF1B5E37) /* Green1-500 */,
          ),
        ),
      ],
    );
  }
}
