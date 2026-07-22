import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNotifaction extends StatelessWidget {
  const CustomNotifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) /* green-50 */,
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset("assets/images/notification.svg"),
    );
  }
}