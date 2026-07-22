import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_textformfield.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';
import 'package:provider/provider.dart';

class AdressSection extends StatelessWidget {
  AdressSection({
    super.key,
    required this.formKey,
    required this.valueNotifier,
  });
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) => Form(
          autovalidateMode: value,

          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextformfield(
                onSaved: (value) {
                  context.read<OrderEntity>().address.name = value;
                },
                hinttext: "الاسم كامل",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onSaved: (value) {
                  context.read<OrderEntity>().address.email = value;
                },
                hinttext: "البريد الإلكتروني",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onSaved: (value) {
                  context.read<OrderEntity>().address.address = value;
                },
                hinttext: "العنوان",
                textInputType: TextInputType.streetAddress,
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onSaved: (value) {
                  context.read<OrderEntity>().address.city = value;
                },
                hinttext: "المدينة",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onSaved: (value) {
                  context.read<OrderEntity>().address.floor = value;
                },
                hinttext: "رقم الطابق , رقم الشقه ..",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onSaved: (value) {
                  context.read<OrderEntity>().address.phone = value;
                },
                hinttext: "رقم الهاتف",
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
