import 'package:flutter/material.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/helpers/helper.dart';

class AddressDisplayContainer extends StatelessWidget {
  const AddressDisplayContainer({
    Key? key,
    required this.address,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);

  final Address address;
  final VoidCallback onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onSelected, // Call the onSelected callback when tapped
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: dark
          ?
          BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(15)
          )
          :
          BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade200,),
            borderRadius: BorderRadius.circular(15)
          ),
          // color: isSelected ? Colors.blue : Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight,
                Text(
                  address.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${address.street}, ${address.city}, ${address.country} ',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(address.phoneNumber.toString(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
                Text(address.postalCode,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
