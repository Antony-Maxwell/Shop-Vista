import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/grid_view_product.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/brand_container.dart';

class TCategoryTabView extends StatelessWidget {
  const TCategoryTabView({
    super.key,
    required this.logo,
    required this.name,
    required this.id,
  });

  final logo;
  final name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return ShimmerProduct().buildShimmerEffectCategory();
                    } else {
                      final filteredProducts =
                          state.productsList.where((product) {
                        return product.brand!.id == id;
                      }).toList();
                      if (filteredProducts.isEmpty) {
                        return const Center(
                          child: Text('No featured products for this brand'),
                        );
                      } else {
                        final List<String> thumbnails = filteredProducts.map((product) => product.thumbnail!).take(3).toList();
                        return BrandContainer(
                          id: id,
                          brandLogo: logo,
                          brandName: name,
                          image: thumbnails,
                          height: 220,
                          isAvailable: true,
                        );
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'You might like',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('View all'))
                  ],
                ),
                const TGridViewProduct(
                  mainAxisExnt: 270,
                )
              ],
            ),
          ),
        ]);
  }
}
