import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/widgets/custom_textformfield.dart';

class passwordfield extends StatefulWidget {
  const passwordfield({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<passwordfield> createState() => _passwordfieldState();
}

class _passwordfieldState extends State<passwordfield> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    
    return CustomTextformfield(
      isPassword: isPassword,
      onSaved: widget.onSaved,
      textInputType: TextInputType.visiblePassword,
      hinttext: "كلمه المرور",
      suffixicon: GestureDetector(
        onTap: () {
          setState(() {
            isPassword = !isPassword;
          });
        },
        child:isPassword?Icon(Icons.remove_red_eye, color: Colors.grey) :
         Icon(Icons.visibility_off, color: Colors.grey),),
    );
  }
}
