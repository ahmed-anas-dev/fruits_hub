import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

class SignupState {}
class SignupEnitialState extends SignupState{}
class SignupLoadingState extends SignupState{}
class SignupSuceesState extends SignupState{
  final UserEntity user;
  SignupSuceesState({required this.user});
}
class SignupErrorState extends SignupState{
  final String message;
  SignupErrorState({required this.message});
}


