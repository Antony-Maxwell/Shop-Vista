
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/presentation/profile/settings_screens/detailed_order.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
    required this.order,
  });

  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.status,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      order.date,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 110,),
                    Text(
                      'Item(s) ${order.productIds.length}'
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Order Id'),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_square,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      order.orderId,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
            IconButton(icon: const Icon(Icons.arrow_forward_ios_outlined), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedOrderScreen(order: order),)),)
          ],
        ),
      ),
    );
  }
}
