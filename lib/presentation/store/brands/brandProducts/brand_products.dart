import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_wishlist/getwishlist_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_card.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';
import 'package:shop_vista/presentation/widgets/store_widgets/brand_container.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts(
      {required this.id,
      required this.brandLogo,
      required this.brandName,
      super.key});

  final String id;
  final String brandLogo;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Brand',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<GetwishlistBloc, GetwishlistState>(
          builder: (context, wishState) {
            if (wishState.isLoading) {
              return ShimmerProduct().buildShimmerEffectBrand();
            }
            return BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return ShimmerProduct().buildShimmerEffectBrand();
                } else {
                  final filteredProducts = state.productsList.where((product) {
                    return product.brand!.id == id;
                  }).toList();
                  if(filteredProducts.isEmpty){
                    return const Center(child: Text('There is no product in this brand'),);
                  }else{
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BrandContainer(
                            height: 72,
                            isAvailable: false,
                            brandLogo: brandLogo,
                            brandName: brandName,
                            id: id),
                        kHeight,
                        const Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) => kHeight,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              final attributes1 =
                                  product.productsAttributes![0];
                              final attributes2 =
                                  product.productsAttributes![1];
                              final attVal1 = product.productsAttributes;
                              final iconColor = wishState.wishList != null &&
                                      wishState.wishList!.contains(product.id)
                                  ? Colors.red
                                  : Colors.grey;
                              return TProductCardWidget(
                                productId: product.id,
                                mainImage: product.thumbnail!,
                                subImages: product.images!,
                                amount: product.price,
                                brand: product.brand!.name.toString(),
                                imageUrl: product.thumbnail.toString(),
                                productName: product.title!,
                                attributes1: attributes1.name,
                                attributes2: attributes2.name,
                                attVals: attVal1,
                                salePrice: product.salePrice,
                                description: product.description,
                                iconColor: iconColor,
                              );
                            })
                      ],
                    ),
                  );
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
