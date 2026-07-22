import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextformfield extends StatelessWidget {
   CustomTextformfield({  this.onSaved,this.isPassword=false,super.key,required this.hinttext,this.suffixicon,required this.textInputType});
  final String hinttext;
  final Widget? suffixicon;
  final void Function(String?)? onSaved;
  final TextInputType textInputType;
  final bool isPassword ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved ,
      key: ValueKey("textformfield"),
      obscureText: isPassword,
      validator: (value) {
        if(value==null||value.isEmpty){
          return "الرجاء ادخال البيانات";
        }return null;
      },
      keyboardType: textInputType,
      
      decoration: InputDecoration(
        
        suffixIcon: suffixicon,
    
        hintText: hinttext,
        hintStyle: AppTextStyles.bold13700.copyWith(color: Color(0xFF949D9E)),
        fillColor: const Color(0xFFF9FAFA),
        filled: true,
        enabledBorder: newMethod(),
        focusedBorder: newMethod(),
    
        border: newMethod(),
      ),
    );
  }

  OutlineInputBorder newMethod() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
