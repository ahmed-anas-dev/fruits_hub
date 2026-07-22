import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key,required this.isCheck,required this.inshange});
  final bool isCheck;
  final ValueChanged<bool>inshange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        inshange(!isCheck);

      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 100),
        width: 24,height: 24,
         decoration: ShapeDecoration(
      color: isCheck?AppColors.primaryColors:Colors.white60,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.50,
          color:isCheck? AppColors.primaryColors:Colors.white,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      
      
        ),child:isCheck?SvgPicture.asset("assets/images/right.svg"):SizedBox() ,),
    );
      
  }
}