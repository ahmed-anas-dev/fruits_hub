import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/shared_preferences_singelton.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_views.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding.dart';
import 'package:fruits_hub/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashViews extends StatefulWidget {
  static const routeName = "splash";

  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}

class _SplashViewsState extends State<SplashViews> {
  @override
  void initState() {
    bool isBoarding = Prefs.getBool("isBoarding");

    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (isBoarding) {
        var isLoogedIn = FirebaseAuthService().isLooged();
        if (isLoogedIn) {
          Navigator.pushReplacementNamed(context, OnBoarding.routeName);
        }else{
          Navigator.pushReplacementNamed(context, LoginViews.routeName);
        }
        
       
      } else {
        Navigator.pushReplacementNamed(context, OnBoarding.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
