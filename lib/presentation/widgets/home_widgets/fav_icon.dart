import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TFavIcon extends StatelessWidget {
  const TFavIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8, // Adjust top position as needed
      right: 8, // Adjust right position as needed
      child: Icon(
        Iconsax.heart5,
        color: Colors.red, // Example color
        size: 24,
      ),
    );
  }
}
