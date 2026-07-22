import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/step_item.dart';

class CheckOutSteps extends StatelessWidget {
  CheckOutSteps({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });
  int currentIndex = 0;
 final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCache != null) {
                pageController.animateToPage(
                  index,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              } else {
                BeuildErrorBar(context, "يرجي تحديد طريقه الدفع");
              }
            },
            child: StepItem(
              text: steps()[index],
              index: (index + 1).toString(),
              isActive: index <= currentIndex,
            ),
          ),
        );
      }),
    );
  }
}

List<String> steps() {
  return ["الشحن", "العنوان", "الدفع"];
}
