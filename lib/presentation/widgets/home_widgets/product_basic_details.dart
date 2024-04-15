import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductDetails extends StatelessWidget {
  const TProductDetails({
    super.key,
    required this.productName,
    required this.brand,
    required this.amount,
  });

  final String productName;
  final String brand;
  final amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              productName,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              brand,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Iconsax.verify5,
              color: Colors.blue,
              size: 15,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ $amount',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(15),
                  )),
              child: Icon(
                Iconsax.add,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
