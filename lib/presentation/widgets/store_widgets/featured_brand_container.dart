import 'package:flutter/material.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/brand_container.dart';

class FeraturedBrands extends StatelessWidget {
  const FeraturedBrands({
    super.key,
    required this.count,
    required this.brandLogo,
    required this.brandName,
    required this.id,
  });

  final int count;
  final List<BrandModel> id;
  final List<BrandModel> brandName;
  final List<BrandModel> brandLogo;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Expanded(
            child: BrandContainer(
              id: id[index].id,
              brandLogo: brandLogo[index].image,
              brandName: brandName[index].name,
          height: 45,
          isAvailable: false,
        )),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 75,
      ),
    );
  }
}
