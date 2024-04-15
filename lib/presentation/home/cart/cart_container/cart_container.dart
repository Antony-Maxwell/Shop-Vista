import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/cart/remove_cart_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartContainer extends StatelessWidget {
  CartContainer({
    super.key,
    required this.cartProducts,
    required this.state,
    required this.isNeedtoShow,
  });

  final List<Products> cartProducts;
  final GetCartState state;
  bool isNeedtoShow;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        final cartQty = state.cart![index];
        final product = cartProducts[index];
        final productAttriVal = product.productsAttributes![0];
        final productAttriVal2 = product.productsAttributes![1];
        return SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: product.thumbnail!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: Container(
                          height: 120,
                          width: 110,
                        ),
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        product.title!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(productAttriVal.name!),
                          ),
                          Expanded(
                            child: Text(
                              productAttriVal.values![0],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(productAttriVal2.name!),
                          ),
                          Expanded(
                            child: Text(
                              productAttriVal2.values![0],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      isNeedtoShow
                          ? Text('Qantity : ${cartQty.quantity}')
                          : SizedBox()
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    isNeedtoShow
                        ? Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : SizedBox(),
                    const Spacer(),
                    isNeedtoShow
                        ? BlocBuilder<UserBloc, UserState>(
                            builder: (context, userState) {
                              return TextButton(
                                  onPressed: () {
                                    RemoveFromCartImplementation()
                                        .removeFromCart(userState.user.userId!,
                                            product.id!, context);
                                  },
                                  child: const Text(
                                    'Remove',
                                    style: TextStyle(color: Colors.red),
                                  ));
                            },
                          )
                        : SizedBox()
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
