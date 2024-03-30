import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TRatingandShare extends StatelessWidget {
  const TRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.yellow,
            ),
            Text.rich(TextSpan(
                children: [TextSpan(text: '5.0  '), TextSpan(text: "(199)")])),
          ],
        ),
        Icon(
          Icons.share,
          size: 20,
        )
      ],
    );
  }
}
