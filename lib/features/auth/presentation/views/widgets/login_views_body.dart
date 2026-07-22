import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_textformfield.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/bloc/cubit/login_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/on_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewsBody extends StatefulWidget {
  const LoginViewsBody({super.key});

  @override
  State<LoginViewsBody> createState() => _LoginViewsBodyState();
}

class _LoginViewsBodyState extends State<LoginViewsBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,

              child: Column(
                children: [
                  CustomTextformfield(
                    onSaved: (nn) {
                      email = nn!;
                    },

                    textInputType: TextInputType.emailAddress,
                    hinttext: "البريد الالكتروني",
                  ),
                  SizedBox(height: 10),
                  passwordfield(
                    onSaved: (ee) {
                      password = ee!;
                    },
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppTextStyles.bold13600.copyWith(
                        color: const Color(0xFF2D9F5D) /* Green1-600 */,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                       context.read<LoginCubit>()..LoginUser(email, password);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("ادخل بيانات صحيحة")),
                        );
                      }
                    },
                    text: "تسجيل دخول",
                  ),
                  const SizedBox(height: 30),
                  const DontHaveAccount(),
                  SizedBox(height: 30),
                  const OnDivider(),
                  SizedBox(height: 20),
                  SocialApp(
                    image: "assets/images/google.svg",
                    onPressed: () {
                      context.read<LoginCubit>()..LoginWithGoogle();
                    },
                    title: "تسجيل بواسطة جوجل",
                  ),
                  SizedBox(height: 10),
                  Platform.isIOS? Column(children: [
                      SocialApp(
                    image: "assets/images/apple.svg",
                    onPressed: () {},
                    title: "تسجيل بواسطة أبل",
                  ),
                  SizedBox(height: 10),
                  ],):SizedBox(),
                
                  SocialApp(
                    image: "assets/images/facebook.svg",
                    onPressed: () {
                      context.read<LoginCubit>()..LoginWithFacebook();
                    },
                    title: "تسجيل بواسطة فيسبوك",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
