import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignInAccount, GoogleSignIn, GoogleSignInAuthentication;

class FirebaseAuthService {
  Future<User> CreateUserwithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "exception FirebaseAuthService.CreateUserwithEmailandPassword ${e.toString()} and code ${e.code}",
      );

      if (e.code == "weak-password") {
        throw CustomException(
          message: 'كلمه السر ضعيفه يرجى اختيار كلمه سر اخرى',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'لا يوجد اتصال بالانترنت يرجى المحاوله مره اخرى',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'لقد قمت بالتجسيل مسبقا حاول مره اخرى');
      } else {
        throw CustomException(message: "لقد حدث خطأ يرجى المحاوله مره اخرى");
      }
    } catch (e) {
       log(
        "exception FirebaseAuthService.CreateUserwithEmailandPassword ${e.toString()}",
      );

      throw CustomException(message: "لقد حدث خطأ يرجى المحاوله مره اخرى");
    }
  }

  Future<User> signInwithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "exception FirebaseAuthService.signInwithEmailandPassword ${e.toString()} and code ${e.code}",);
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'البريد الالكتروني او الباسورد غير صحيح',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'البريد الالكتروني او الباسورد غير صحيح',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'لا يوجد اتصال بالانترنت يرجى المحاوله مره اخرى',
        );
      } else {
        throw CustomException(message: "الاميل او الباسورد غير صحيح حاول مره اخرى");
      }
    } catch (e) {
      log(
        "exception FirebaseAuthService signInwithEmailandPassword ${e.toString()}",
      );
      throw CustomException(message: e.toString());
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
static Future deleteUser()async{
  await FirebaseAuth.instance.currentUser!.delete();
}
bool isLooged() {
  return FirebaseAuth.instance.currentUser != null;
} 
}


