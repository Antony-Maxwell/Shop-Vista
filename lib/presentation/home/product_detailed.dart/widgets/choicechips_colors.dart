import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choice_chip_size.dart';

class TChoiceSize extends StatelessWidget {
  const TChoiceSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TChoiceChip(
          label: 'EU 34',
          selected: true,
          labelColor: Colors.black,
        ),
        TChoiceChip(
          label: 'EU 36',
          selected: false,
          labelColor: Colors.black,
        ),
        TChoiceChip(
          label: 'Eu 38',
          selected: false,
          labelColor: Colors.black,
        ),
        TChoiceChip(
          label: 'EU 32',
          selected: false,
          labelColor: Colors.black,
        ),
      ],
    );
  }
}
