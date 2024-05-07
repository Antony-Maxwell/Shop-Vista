import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/color_choicechip/choice_chip_color_bloc.dart';
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
    return BlocBuilder<ChoiceChipColorBloc, ChoiceChipColorState>(
      builder: (context, state) {
        return Row(
          children: [
            TChoiceChip(
              label: val1,
              selected: state.selectedIndex == 0,
              color: GetColor().getColorFromName(val1),
              labelColor: Colors.white,
              onSelected: (selected) {
                if(selected){
                  context.read<ChoiceChipColorBloc>().add(SelectChoiceChip(0, val1));
                }
              },
            ),
            TChoiceChip(
              label: val2,
              selected: state.selectedIndex == 1,
              onSelected: (selected) {
                if(selected){
                  context.read<ChoiceChipColorBloc>().add(SelectChoiceChip(1, val2));
                }
              },
              color: GetColor().getColorFromName(val2),
              labelColor: Colors.white,
            ),
          ],
        );
      },
    );
  }
}
