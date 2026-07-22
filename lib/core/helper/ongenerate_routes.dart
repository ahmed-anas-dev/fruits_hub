import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_views.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view.dart';
import 'package:fruits_hub/features/bestselling/presentation/views/best_selling_views.dart';
import 'package:fruits_hub/features/checkout/presentation/views/check_out_view.dart';
import 'package:fruits_hub/features/home/presentation/domain/entities/car_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_views.dart';

Route<dynamic>OnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViews.routeName:
    return MaterialPageRoute(builder: (context)=>LoginViews());
    case CheckOutView.routeName:
    return MaterialPageRoute(builder: (context)=>CheckOutView(
      cartItem: settings.arguments as CarEntity,
    ));
    case BestSellingViews.routeName:
    return MaterialPageRoute(builder: (context)=>BestSellingViews());
    case SignupView.routeName:
    return MaterialPageRoute(builder: (context)=>SignupView());
    case SplashViews.routeName:
      return MaterialPageRoute(builder: (context) => const SplashViews());
      case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
      case OnBoarding.routeName:
     return MaterialPageRoute(builder: (context) =>  OnBoarding());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());

  }
}
