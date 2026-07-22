import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSelection extends StatefulWidget {
  const ShippingSelection({super.key});

  @override
  State<ShippingSelection> createState() => _ShippingSelectionState();
}

class _ShippingSelectionState extends State<ShippingSelection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ShippingItem(
          onpressed: () {
            selectedIndex = 0;
            setState(() {});
            context.read<OrderEntity>().payWithCache = true;
          },

          isSelected: selectedIndex == 0,
          title: "الدفع عند الاستلام",
          subtitle: "التسليم من المكان",
          price: (context.read<OrderEntity>().carItem.calculateTotalPrice()+20).toString(),
        ),
        SizedBox(height: 10),
        ShippingItem(
          onpressed: () {
            selectedIndex = 1;
            setState(() {});
            context.read<OrderEntity>().payWithCache = false;
          },
          isSelected: selectedIndex == 1,
          title: "الدفع اونلاين",
          subtitle: "يرجي تحديد طريقه الدفع",
          price: context.read<OrderEntity>().carItem.calculateTotalPrice().toString(),
        ),
      ],
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
