import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/oreder_summary_widgets.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key,required this.pageController});
 final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrederSummaryWidgets(),
        SizedBox(height: 10),
        PaymentItem(
          title: "عنوان التوصيل",
          child: Row(
            children: [
              Icon(Icons.location_on, color: Colors.black),

              Text(
                "${context.read<OrderEntity>().address}",
                textAlign: TextAlign.right,
                style: AppTextStyles.bold40013.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
              Spacer(),
              Icon(Icons.edit_note),
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(pageController.page!.toInt() - 1, duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                  

                },
                child: Text("تعديل", style: AppTextStyles.bold40013.copyWith(color: Colors.grey))),
            ],
          ),
        ),
      ],
    );
  }
}
