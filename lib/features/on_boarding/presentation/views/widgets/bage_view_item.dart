import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/shared_preferences_singelton.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_views.dart';
import 'package:flutter_svg/svg.dart';

class BageViewItem extends StatelessWidget {
  BageViewItem({
    super.key,
    required this.BackgroundImage,
    required this.Image,
    required this.subtitle,
    required this.title,
    required this.isVisiple,
  });
  final String Image, BackgroundImage;
  final Widget title;
  final String subtitle;
  final bool isVisiple;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(BackgroundImage, fit: BoxFit.fill),
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: SvgPicture.asset(Image),
              ),
              Positioned(
                child: Visibility(
                  visible: isVisiple,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () {
                        Prefs.setBool("isBoarding", true);
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(LoginViews.routeName);
                      },
                      child: Text(
                        "تخط",
                        style: AppTextStyles.bold40013.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        title,
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold13.copyWith(
              color: AppColors.subtitlecolors,
            ),
          ),
        ),
      ],
    );
  }
}
