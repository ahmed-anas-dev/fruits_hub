import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

class SocialApp extends StatelessWidget {
  const SocialApp({
    super.key,
    required this.image,
    required this.onPressed,
    required this.title,
  });
  final String image;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: BorderSide(width: 1, color: const Color(0xFFDCDEDE)),
          ),
        ),
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold60016.copyWith(
              color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            ),
          ),
        ),
      ),
    );
  }
}
