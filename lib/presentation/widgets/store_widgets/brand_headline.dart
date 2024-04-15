import 'package:flutter/material.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';
import 'package:shop_vista/presentation/store/brands/view_all.dart';

class BrandHeadline extends StatelessWidget {
  const BrandHeadline({
    required this.id,
    super.key,
  });

  final List<BrandModel> id;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Featured Brands',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllBrands(id: id),));
          },
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
