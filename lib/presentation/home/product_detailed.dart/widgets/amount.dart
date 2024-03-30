import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/discount_container.dart';

class AmountAndDiscount extends StatelessWidget {
  const AmountAndDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TDiscountContainer(),
        SizedBox(
          width: 5,
        ),
        Text("2̶0̶0̶.̶0̶ ",
            style: TextStyle(
              fontSize: 18,
            )),
        Text(' \$130',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ],
    );
  }
}
