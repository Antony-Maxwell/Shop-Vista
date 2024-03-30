import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_card.dart';

class TGridViewProduct extends StatelessWidget {
  const TGridViewProduct({
    required this.itemCount,
    super.key,
    this.mainAxisExnt,
  });
  final itemCount;
  final double? mainAxisExnt;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_, index) => TProductCardWidget(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExnt,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }
}
