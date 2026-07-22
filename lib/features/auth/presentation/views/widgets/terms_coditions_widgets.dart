import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';

class TermsCoditionsWidgets extends StatefulWidget {
  const TermsCoditionsWidgets({super.key,required this.isChange});
  final ValueChanged<bool>isChange;

  @override
  State<TermsCoditionsWidgets> createState() => _TermsCoditionsWidgetsState();
}

class _TermsCoditionsWidgetsState extends State<TermsCoditionsWidgets> {
     bool isterms=false;
    

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          inshange: (value) {
            isterms=value;
            widget.isChange(value);
            setState(() {
              
            });
          },
          isCheck: isterms),
          SizedBox(width: 15,),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.bold13600.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصه بنا',
                  style: AppTextStyles.bold13600.copyWith(
                    color: const Color(0xFF2D9F5D) /* Green1-600 */,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
