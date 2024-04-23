import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_wishlist/getwishlist_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_card.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key, this.userId});
  final userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        BlocProvider.of<GetwishlistBloc>(context)
            .add(GetwishlistEvent.getWishlist(state.user.userId!));
        print('user is ${state.user.userId}');
        return Scaffold(
          appBar: TAppBar(
            title: Text(
              'Wishlist',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            action: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<GetwishlistBloc, GetwishlistState>(
              builder: (context, wishlistState) {
                if(wishlistState.wishList!.isEmpty){
                  return const Center(child: Text('Wishlist is empty'),);
                }else if (wishlistState.isLoading) {
                  return ShimmerProduct().buildShimmerEffect();
                } else {
                  return BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return ShimmerProduct().buildShimmerEffect();
                      } else {
                        final List<Products> wishListProducts = state.productsList
                            .where((element) =>
                                wishlistState.wishList!.contains(element.id))
                            .toList();
                        return GridView.builder(
                          itemCount: wishListProducts.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product = wishListProducts[index];
                            final attributes1 = product.productsAttributes![0];
                            final attributes2 = product.productsAttributes![1];
                            final attVal1 = product.productsAttributes;
                            final iconColor = wishlistState.wishList!.contains(product.id)
                            ? Colors.red
                            : Colors.grey;
                            print(iconColor);
                            final iconColorNonNull = iconColor ?? Colors.grey;
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
                              iconColor: iconColorNonNull,
                            );
                          },
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 280,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
