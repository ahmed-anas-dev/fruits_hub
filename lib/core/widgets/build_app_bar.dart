import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_notification.dart';

AppBar buildappbar(context,{required String name,bool showBackButton=true,bool showNotification=true}) {
    return AppBar(
      leading: Visibility(
        visible: showBackButton,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
      actions: [
        
        Visibility(
          visible: showNotification,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomNotifaction(),
          ),
        ),
      ],
      centerTitle: true,
      title: Text(name, style: AppTextStyles.bold19700),
      backgroundColor: Colors.transparent,
    );
  }

