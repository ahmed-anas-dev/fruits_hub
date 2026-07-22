import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createEmailandPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInwithEmailandPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInwithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity user,});
  Future<UserEntity> getUserData({required String uid});
  Future saveData(UserEntity user);
  

}
