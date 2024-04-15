import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choice_chip_size.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/color_from_name.dart';

class TChoiceColors extends StatelessWidget {
  const TChoiceColors({
    super.key,
    this.val1,
    this.val2,
  });

  final val1;
  final val2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TChoiceChip(
          label: val1,
          selected: true,
          color: GetColor().getColorFromName(val1),
          labelColor: Colors.white,
        ),
        TChoiceChip(
          label: val2,
          selected: false,
          color: GetColor().getColorFromName(val2),
          labelColor: Colors.white,
        ),
      ],
    );
  }
}
