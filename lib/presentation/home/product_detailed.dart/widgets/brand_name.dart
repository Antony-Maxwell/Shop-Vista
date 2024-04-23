import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandName extends StatelessWidget {
  const BrandName({
    super.key,
    required this.brandName,
  });

  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(brandName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Iconsax.verify5,
          color: Colors.blue,
          size: 20,
        )
      ],
    );
  }
}
