import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/core/widgets/custom_model_progress_hud.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/bloc/cubit/login_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/bloc/cubit/login_state.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_views_body.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViews extends StatelessWidget {
  static const routeName = "login";
  
  const LoginViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "تسجيل دخول"),
        body: Builder(
          builder: (context) {
            return BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuceesState) {
                  Navigator.pushNamed(context, MainView.routeName);
                
                } else if (state is LoginErrorState) {
                  BeuildErrorBar(context, state.message);
                }
              },
              builder: (context, state) {
                return CustomModelProgressHud(
                    isLoading: state is LoginLoadingState, child: LoginViewsBody()); //ModalProgressHUD(inAsyncCall: isLoading: , child: child)
              },
            );
          },
        ),
      ),
    );
  }
}
