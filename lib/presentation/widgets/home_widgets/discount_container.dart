import 'package:flutter/material.dart';

class TDiscountContainer extends StatelessWidget {
  const TDiscountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8, // Adjust top position as needed
      left: 8, // Adjust left position as needed
      child: Container(
        width: 30,
        height: 20, // Example color
        decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          " 20% ",
          style: Theme.of(context).textTheme.labelLarge!.apply(),
        ),
      ),
    );
  }
}
