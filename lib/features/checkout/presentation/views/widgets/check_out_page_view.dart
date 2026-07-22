import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/adress_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_selection.dart';

class CheckOutPageView extends StatelessWidget {
  CheckOutPageView({
    super.key,
    required this.valueNotifier,
    required this.pageController,
    required this.formKey,
  });
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: stepsPages().length,
        itemBuilder: (context, index) {
          return stepsPages()[index];
        },
      ),
    );
  }

  List<Widget> stepsPages() {
    return [
      ShippingSelection(),
      AdressSection(
        valueNotifier: valueNotifier,
        formKey: formKey),
      PaymentSection(
        pageController: pageController,
      ),
    ];
  }
}
