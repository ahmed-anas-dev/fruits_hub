import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/decoration_app.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key,required this.title,required this.child});
final String title;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: DecorationApp.greyBoxDecoration,
          child:child ,
            
          
          
        ),


      ],);
    
  }
}