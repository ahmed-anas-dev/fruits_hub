import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/signup_state.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "حساب جديد"),
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupSuceesState) {
                  Navigator.pop(context);
                } else if (state is SignupErrorState) {
                  BeuildErrorBar(context, state.message);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: (state is SignupLoadingState) ? true : false,
                  child: SignupViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
 