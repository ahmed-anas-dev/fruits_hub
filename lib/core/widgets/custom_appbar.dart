import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
       // Navigator.pop(context);
      },
      child: Icon(Icons.arrow_forward_ios_rounded),
    ),
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19700),
  );
}
