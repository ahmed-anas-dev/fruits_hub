import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_services.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/shared_preferences_singelton.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
//
class AuthRepoImpl extends AuthRepo {
  final DataServices dataServices;
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService, required this.dataServices});
  @override
  Future<Either<Failure, UserEntity>> createEmailandPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.CreateUserwithEmailandPassword(
        email: email,
        password: password,
        
      );
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteuser(user);
      return left(ServerError(message:e.message));
    }catch (e) {
     log("exception AuthRepoImpl createEmailandPassword ${e.toString()}");

      return left(ServerError(message: "لقد حدث خطأ يرجى المحاوله مره اخرى"));
    }
  }

  Future<void> deleteuser(User? user) async {
    if (user != null) {
      await FirebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInwithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInwithEmailandPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      await saveData(userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      log(
        "exception AuthRepoImpl signInwithEmailandPassworddd ${e.toString()}",
      );
      return left(ServerError(message: e.message));
    }
  }

  Future<Either<Failure, UserEntity>> signInwithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userentity = UserModel.fromFirebase(user);
      var userExist = await dataServices.chekIfDataExist(
        path: BackendEndpoint.ExistData,
        documentId: user.uid,
      );
      if (userExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userentity);
      }

      return right(userentity);
    } on CustomException catch (e) {
      
      await deleteuser(user);
      log("exception AuthRepoImpl signInwithGoogle ${e.toString()}");

      
      return left(ServerError(message: "حدث خطأ يرجى المحاوله مره اخرى"));
    }
  }

  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userentity = UserModel.fromFirebase(user);
      await addUserData(user: userentity);
      return right(userentity);
    } on CustomException catch (e) {
      await deleteuser(user);
      log("exception AuthRepoImpl signInWithFacebook ${e.toString()}");
      return left(ServerError(message: "حدث خطأ يرجى المحاوله مره اخرى"));
    }
  }

  @override
  Future addUserData({required UserEntity user, String? documentId}) async {
    await dataServices.addData(
      documentId: user.uid,

      path: BackendEndpoint.addUserData,
      data: UserModel.FromEntity(user).toMap(),
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid, String? documentId}) async {
    var userDAta = await dataServices.getData(
      path: BackendEndpoint.getUserData,
      documentId: uid,
    );
    if(userDAta==null){
      throw Exception("user not found");
    }

    return UserModel.fromjson(userDAta);
  }
  
  @override
  Future<dynamic> saveData(UserEntity user)async {
    var jsonData=jsonEncode(UserModel.FromEntity(user).toMap());
    await Prefs.setString("user", jsonData);
  }
}
