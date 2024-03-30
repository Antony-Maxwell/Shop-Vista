import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choice_chip_size.dart';

class TChoiceColors extends StatelessWidget {
  const TChoiceColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TChoiceChip(
          label: 'Blue',
          selected: true,
          color: Colors.blue,
          labelColor: Colors.white,
        ),
        TChoiceChip(
          label: 'Green',
          selected: false,
          color: Colors.green,
          labelColor: Colors.white,
        ),
        TChoiceChip(
          label: 'Red',
          selected: false,
          color: Colors.red,
          labelColor: Colors.white,
        ),
        TChoiceChip(
          label: 'Black',
          selected: false,
          color: Colors.black,
          labelColor: Colors.white,
        ),
      ],
    );
  }
}
