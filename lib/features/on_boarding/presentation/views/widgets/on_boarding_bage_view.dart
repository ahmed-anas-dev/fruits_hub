import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/bage_view_item.dart';

class OnBoardingBageView extends StatelessWidget {

final  PageController pageController;
OnBoardingBageView({ required this.pageController});


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
      BageViewItem(
        isVisiple:true,
        BackgroundImage: "assets/images/background 1.svg"
      , Image: "assets/images/image1.svg",
      subtitle: ("اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية."),
       
        title: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("مرحبًا بك في ",style: AppTextStyles.bold23700,),
          Text("HUB",style: AppTextStyles.bold23700.copyWith(color: AppColors.hubcolor),),
          Text("Fruit",style: AppTextStyles.bold23700.copyWith(color: AppColors.fruitcolor),)
        ],)),
        BageViewItem(
        isVisiple:false,

          BackgroundImage: "assets/images/background 2.svg"
      , Image: "assets/images/image2.svg",
      subtitle: "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
       
        title: Text("ابحث وتسوق",style: AppTextStyles.bold23700)),
        
    ],);
  }
}