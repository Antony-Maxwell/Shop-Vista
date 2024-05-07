
import 'package:flutter/material.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/helpers/helper.dart';

class ShippingAddressContainer extends StatelessWidget {
  const ShippingAddressContainer({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      decoration: dark
      ?
      BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15)
      )
      :
      BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              'Shipping Address',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHeight,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 42,
                    ),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${address.postalCode}, ${address.city}, ${address.country}',
                        ),
                        Text(
                          address.name,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      address.phoneNumber.toString(),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
