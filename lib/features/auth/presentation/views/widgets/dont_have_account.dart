import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب ؟',
            style: AppTextStyles.bold60016.copyWith(
              color: const Color(0xFF949D9E) /* Grayscale-400 */,
            ),
          ),
    
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap=(){
              Navigator.pushNamed(context, SignupView.routeName);
            },
            text: ' قم بانشاء حساب',
            style: AppTextStyles.bold60016.copyWith(
              color: const Color(0xFF1B5E37) /* Green1-500 */,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}