import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [SvgPicture.asset("assets/images/blant.svg")],
        ),
        SvgPicture.asset("assets/images/logo.svg"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset("assets/images/splashbotton.svg",width: 409,fit: BoxFit.fill,),
          ],
        ),
      ],
    );
  }
}
