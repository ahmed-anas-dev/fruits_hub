import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart' show OrderEntity;
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class OrederSummaryWidgets extends StatelessWidget {
  const OrederSummaryWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "ملخص الطلب :",
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.bold40013.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().carItem.calculateTotalPrice()} جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.bold60016.copyWith(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                'التوصيل :',
                style: AppTextStyles.bold40013.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
              Spacer(),
              Text(
                '30جنية',
                textAlign: TextAlign.right,
                style: AppTextStyles.bold13600.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-500 */,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(
            thickness: .5,
            color: const Color(0xFFCACECE) /* Grayscale-200 */,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'الكلي',
                style: AppTextStyles.bold16700.copyWith(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                ),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().carItem.calculateTotalPrice()+30} جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.bold60016.copyWith(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                ),
              ),
            ],
          ),
    
        ],
      ),
    );
  }
}
