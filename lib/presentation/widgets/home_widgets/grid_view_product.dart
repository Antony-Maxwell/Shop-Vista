import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/application/home/get_wishlist/getwishlist_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_card.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';

class TGridViewProduct extends StatelessWidget {
  const TGridViewProduct({
    super.key,
    this.mainAxisExnt,
  });

  final double? mainAxisExnt;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductsBloc>(context).add(const LoadProductDetails());
    });
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        if(userState.isLoading){
          return ShimmerProduct().buildShimmerEffect();
        }
        BlocProvider.of<GetwishlistBloc>(context).add(GetwishlistEvent.getWishlist(userState.user.userId!));
        return BlocBuilder<GetwishlistBloc, GetwishlistState>(
          builder: (context, wishState) {
            if (wishState.isLoading) {
              return ShimmerProduct().buildShimmerEffect();
            }
            return BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return ShimmerProduct().buildShimmerEffect();
                } else if (state.hasError) {
                  return const Center(
                    child: Text('Failed to fetch products'),
                  );
                } else {
                  return GridView.builder(
                    itemCount: state.productsList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = state.productsList[index];
                      final attributes1 = product.productsAttributes![0];
                      final attributes2 = product.productsAttributes![1];
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
                        stockCount: product.stock,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: mainAxisExnt,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
