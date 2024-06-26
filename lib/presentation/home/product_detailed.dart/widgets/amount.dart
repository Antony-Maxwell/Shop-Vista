import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/discount_container.dart';

class AmountAndDiscount extends StatelessWidget {
  const AmountAndDiscount({
    super.key,
    this.salePrice,
    this.realPrice,
  });

  final salePrice;
  final realPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TDiscountContainer(
          ogPrice: realPrice,
          salePrice: salePrice,
        ),
        const SizedBox(
          width: 5,
        ),
        Text("$realPrice",
            style: const TextStyle(
              fontSize: 18,
            )),
        Text(' \$$salePrice',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ],
    );
  }
}
