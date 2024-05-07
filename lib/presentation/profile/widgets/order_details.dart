
import 'package:flutter/material.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.order,
  });

  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    const TSectionHeading(
        title: 'Details', showActionButton: false),
    kHeight,
    kHeight,
    Row(
      children: [
        const Text('Order Places',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        Text(order.date),
      ],
    ),
    kHeight,
    Row(
      children: [
        const Text('Order ID',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        Text(order.orderId),
      ],
    ),
    kHeight,
    Row(
      children: [
        const Text('Expected Delivery',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        if (order.status == 'Delivered')
          const Text('Delivered')
        else
          const Text('Within 7 days'),
      ],
    ),
                    ]
                  );
  }
}
