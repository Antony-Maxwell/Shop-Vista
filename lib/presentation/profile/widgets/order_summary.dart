
import 'package:flutter/material.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/helpers/helper.dart';

class OrderSummaryContainer extends StatelessWidget {
  const OrderSummaryContainer({
    super.key,
    required this.order,
  });

  final Orders order;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      decoration: dark
      ?
      BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      )
      :
      BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHeight,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Item(s) Subtotal : '),
                    Text("\$${order.orderTotal.toString()}"),
                  ],
                ),
                kHeight,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping & Handling : '),
                    Text("\$12.0")
                  ],
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total before tax : '),
                    Text("\$${order.orderTotal + 12..toString()}")
                  ],
                ),
                kHeight,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estimated tax to be collected : '),
                    Text("\$3.0")
                  ],
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Grand Total : ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text("\$${order.orderTotal + 15..toString()}", style :const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ],
            )
          ],
        ),
        ),
    );
  }
}
