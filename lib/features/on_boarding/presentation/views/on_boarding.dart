import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';

class OnBoarding extends StatelessWidget {
static const routeName="onboarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBoardingBody()),
    );
  }
}