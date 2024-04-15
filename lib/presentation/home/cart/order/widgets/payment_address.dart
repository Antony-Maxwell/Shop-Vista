
import 'package:flutter/material.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/infrastructure/upi/upi_integration.dart';
import 'package:shop_vista/presentation/home/cart/order/widgets/address_details.dart';

class PaymentAndAddress extends StatelessWidget {
  const PaymentAndAddress({
    super.key,
    required this.totalPrice,
    required this.shippingfee,
    required this.tax,
    required this.discountamt,
    required this.total,
    required this.address,
    required this.userState,
  });

  final double totalPrice;
  final int shippingfee;
  final int tax;
  final int discountamt;
  final int total;
  final Address address;
  final UserState userState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Subtotal',
              style: TextStyle(fontSize: 16),
            ),
            Text('\$$totalPrice',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold))
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee',
                style: TextStyle(fontSize: 16)),
            Text('\$$shippingfee',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold)),
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee',
                style: TextStyle(fontSize: 16)),
            Text('\$$tax',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold)),
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount amount',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\$$discountamt',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        kHeight,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Order Total',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${total + totalPrice}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Colors.black,
        ),
        kHeight,
        const Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Expanded(
            child: UpiBottomSheet(
                orderId: 'akjfnknfka')),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (BuildContext context) {
                    return AddressShowWidget();
                  },
                );
              },
              child: Text(
                'Change',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
        kHeight,
        Row(
          children: [
            Icon(Icons.person,size: 42,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${address.street}, ${address.city}, ${address.country} ',),
                Text(
          userState.user.userName,
        ),
              ],
            )
          ],
        ),
        kHeight,
        Row(
          children: [
            Icon(Icons.phone, size: 34,),
            Text(userState.user.phoneNumber.toString()),
          ],
        )
      ],
    );
  }
}
