import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_views.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_bage_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
late PageController pageController;
  var currentpage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentpage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingBageView(pageController: pageController)),

        DotsIndicator(
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColors,
            color: currentpage == 1
                ? AppColors.primaryColors
                : AppColors.primaryColors.withOpacity(.5),
          ),
          dotsCount: 2,
        ),
        SizedBox(height: 16),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentpage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(onPressed: () {
             // Prefs.setBool("isBoarding", true);
              Navigator.of(context).pushReplacementNamed(LoginViews.routeName);

            }, text: "ابدأ الان"),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
