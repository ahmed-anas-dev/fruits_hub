import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_textformfield.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/do_have_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_coditions_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String name, password, email;
  late bool isChange=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 22),
              CustomTextformfield(
                onSaved: (b) {
                  name = b!;
                },
                hinttext: "الاسم كامل",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 10),
              CustomTextformfield(
                onSaved: (d) {
                  email = d!;
                },
                hinttext: "البريد الالكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              passwordfield(
                onSaved: (ee) {
                  password = ee!;
                },
              ),
              SizedBox(height: 10),
              TermsCoditionsWidgets(
                isChange: (value) {
                  isChange=value;
                  

                },
              ),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                   if(isChange){
                    context.read<SignupCubit>().createEmailandPassword( email, password, name);
                   }else{
                    BeuildErrorBar(context, "يرجى الموافقه على الشروط والاحكام");
                   }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "إنشاء حساب جديد",
              ),
              SizedBox(height: 20),
              DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

