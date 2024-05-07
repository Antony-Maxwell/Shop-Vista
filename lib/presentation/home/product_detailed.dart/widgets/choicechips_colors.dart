import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/size_choicechip/size_choice_chip_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choice_chip_size.dart';

class TChoiceSize extends StatelessWidget {
  const TChoiceSize({
    super.key,
    required this.sizesList,
  });

  final List<ProductsAttribute>? sizesList;

  @override
  Widget build(BuildContext context) {
    final sizes = sizesList![1].values;
    return BlocBuilder<SizeChoiceChipBloc, SizeChoiceChipState>(
      builder: (context, state) {
        return Wrap(
          children: List.generate(
            sizesList!.length,
            (index) => TChoiceChip(
              label: sizes![index],
              selected: state.selectedIndex  == index,
              onSelected: (selected) {
                context.read<SizeChoiceChipBloc>().add(SelectChoiceChipSize(index, sizes[index]));
              },
            ),
          ),
        );
      },
    );
  }
}
