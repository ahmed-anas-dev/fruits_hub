
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit(this.authRepo):super(SignupEnitialState());
  final AuthRepo authRepo;
  Future<void>createEmailandPassword( String email,String password,String name)async{
    emit(SignupLoadingState());
    final result=await authRepo.createEmailandPassword(email, password, name);
    result.fold(
      (failur)=>{
        emit(SignupErrorState(message: failur.message))
      }
      , (userEntity)=>{
        emit(SignupSuceesState(user: userEntity))

      }
      );

  }

}