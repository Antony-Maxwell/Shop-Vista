import 'package:flutter/material.dart';

class TDiscountContainer extends StatelessWidget {
  const TDiscountContainer({
    super.key, required this.ogPrice,required this.salePrice,
  });
  final ogPrice;
  final salePrice;

  @override
  Widget build(BuildContext context) {
    final double priceOg = ogPrice ?? 0.0;
    final double priceSale = salePrice ?? 5.0;
    double discountPercentage = ((priceOg - priceSale)/priceOg) * 100;
    double roundedDiscountPercentage = double.parse(discountPercentage.toStringAsFixed(0));
    return Container(
      width: 45,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        " $roundedDiscountPercentage %",
        style: Theme.of(context).textTheme.labelLarge!.apply(),
      ),
    );
  }
}
