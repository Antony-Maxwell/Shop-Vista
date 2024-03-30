import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/grid_view_product.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, this.categoryName});

  final categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text('${categoryName}'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                TGridViewProduct(
                  mainAxisExnt: 280,
                )
              ],
            ),
          ),
        ));
  }
}
