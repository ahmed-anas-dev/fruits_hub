import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_buttom.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342/158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: SvgPicture.asset("assets/images/image2.svg",fit: BoxFit.fill,)),
              Container(
                width: itemWidth * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg("assets/images/featured.svg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height: 24,),
                    Text(
                      'عروض العيد',
                      style: AppTextStyles.bold40013.copyWith(color: Colors.white),
                    ),
                  const  Spacer(),
                    Text(
                      'خصم 25%',
                      style: AppTextStyles.bold19700.copyWith(color: Colors.white),
                    ),
                   const SizedBox(height: 11,),
                    FeaturedButtom(onPressed: () {}),
                   const SizedBox(height: 29,)
                  ],
                              ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
