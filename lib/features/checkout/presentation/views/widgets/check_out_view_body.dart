import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_page_view.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/check_out_steps.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  void handelAddressSectionValdation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }else{
      valueNotifier.value = AutovalidateMode.always;
    }
  }
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(AutovalidateMode.disabled);

  late PageController pageController;
  initState() {
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });

    super.initState();
  }

  dispose() {
    valueNotifier.dispose();
    pageController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 20),
        CheckOutSteps(
          pageController: pageController,
          currentIndex: currentIndex,
        ),
        Expanded(
          child: CheckOutPageView(
            valueNotifier: valueNotifier,
            formKey: formKey,
            pageController: pageController,
          ),
        ),

        CustomButton(
          onPressed: () {
            if (currentIndex == 0) {
              handelSheppingSectionValdation(context);
            } else if (currentIndex == 1) {
              handelAddressSectionValdation(context);
            }
          },
          text: currentTitle(currentIndex),
        ),
        SizedBox(height: 60),
      ],
    );
  }

  void handelSheppingSectionValdation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCache != null) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      BeuildErrorBar(context, "يرجي تحديد طريقه الدفع");
    }
  }
}

String currentTitle(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return "التالي";
    case 1:
      return "التالي";
    case 2:
      return "الدفع عبر PayPal";
    default:
      return "الشحن";
  }
}
