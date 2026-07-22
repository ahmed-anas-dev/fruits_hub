import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({required this.onpressed,super.key, required this.title, required this.subtitle, required this.price,required this.isSelected});
  final String title,subtitle,price;
  final bool isSelected;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: IntrinsicHeight(
        child: Container(
         
          padding: const EdgeInsets.only(
        top: 16,
        left: 13,
        right: 28,
        bottom: 16,
          ),
          
          decoration: ShapeDecoration(
            
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:isSelected ? const Color(0xFF1B5E37) : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4)),
          ),
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
          padding: const EdgeInsets.all(2),
          width: 18,
          height: 18,
          decoration: ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
          ),
          child:Container(
             width: 18,
          height: 18,
          decoration: ShapeDecoration(
        color: isSelected ? const Color(0xFF1B5E37) : Colors.transparent,
        shape: OvalBorder(
          
          
        ),
           
          ),
          ) ,
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          title,
          style: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w600,
        height: 1.70,
          ),
        ),
        SizedBox(height: 6,),
        Text(
        subtitle,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black.withValues(alpha: 0.50),
          fontSize: 13,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
          height: 1.60,
        ),
          ),
        
          ],
        ),
        Spacer(),
        Center(
          child: Text(
       " $price جنيه",
        style: TextStyle(
          color: const Color(0xFF3A8B33),
          fontSize: 13,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
          ),
        )
          ],)
        ),
      ),
    );
  }
}