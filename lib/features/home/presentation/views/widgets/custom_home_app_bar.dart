import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/get_user.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_notification.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Image.asset("assets/images/ppp.png"),
      title: Text(
  'صباح الخير !..',
  textAlign: TextAlign.right,
  style: AppTextStyles.bold16400.copyWith(    color: const Color(0xFF949D9E) /* Grayscale-400 */,
),

    
  
),
subtitle: Text(
  
  (GetUser()?.name)??"مستخدم جديد",
  textAlign: TextAlign.right,
  style: AppTextStyles.bold16700.copyWith(    color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
)
),
trailing: CustomNotifaction()
    );
  }
}
