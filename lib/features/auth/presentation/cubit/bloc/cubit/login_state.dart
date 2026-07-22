
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}
final class LoginSuceesState extends LoginState {
  final UserEntity user;
  LoginSuceesState({required this.user});
}
final class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
}

