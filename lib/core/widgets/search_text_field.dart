import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,

        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset("assets/images/filter.svg")),
          ),

          prefixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset("assets/images/search.svg")),
          ),

          hintText: "ابحث هنا......",

          hintStyle: AppTextStyles.bold40013.copyWith(
            color: const Color(0xFF949D9E) /* Grayscale-400 */,
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: newMethod(),
          focusedBorder: newMethod(),

          border: newMethod(),
        ),
      ),
    );
  }

  OutlineInputBorder newMethod() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
