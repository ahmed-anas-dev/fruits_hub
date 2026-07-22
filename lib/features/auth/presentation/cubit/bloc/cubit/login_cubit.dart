

import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/bloc/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitialState());
  final AuthRepo authRepo;

  Future<void> LoginUser(String email, String password)async{
    emit(LoginLoadingState());
    final result=await authRepo.signInwithEmailandPassword(email, password);
    result.fold(
      (failure)=>{
        emit(LoginErrorState(message: failure.message))
      }
      , (userEntity)=>{
        emit(LoginSuceesState(user: userEntity))
      }
    );
  }

  Future<void> LoginWithGoogle()async{
    emit(LoginLoadingState());
    final result=await authRepo.signInwithGoogle();
    result.fold(
      (failure)=>{
        emit(LoginErrorState(message: failure.message))
      }
      , (userEntity)=>{
        emit(LoginSuceesState(user: userEntity))
      }
    );
  }
  Future<void> LoginWithFacebook()async{
    emit(LoginLoadingState());
    final result=await authRepo.signInWithFacebook();
    result.fold(
      (failure)=>{
        emit(LoginErrorState(message: failure.message))
      }
      , (userEntity)=>{
        emit(LoginSuceesState(user: userEntity))
      }
    );
  }
}
