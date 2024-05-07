import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/get_quantity/get_quantity_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/store/cart_quantity/cart_count_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/cart/add_cart_cartscreen.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/cart/remove_cart_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_vista/presentation/home/cart/cart_container/cart_quty_updation.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/add_to_cart.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.cartProducts,
    required this.state,
  });

  final List<Products> cartProducts;
  final GetCartState state;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final cartQty = state.cart![index];
          final product = cartProducts[index];
          final productAttriVal = product.productsAttributes![0];
          final productAttriVal2 = product.productsAttributes![1];
          final finalAmount = int.parse(cartQty.quantity) * product.salePrice!;
          return Container(
            decoration: dark
            ?
            BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            )
            :
            BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 140,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: product.thumbnail!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const SizedBox(
                              height: 120,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.title!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(productAttriVal.name!),
                            ),
                            Expanded(
                              child: Text(
                                cartQty.color,
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
                                cartQty.size,
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text('Qty'),
                            ),
                            Expanded(
                              child: Text(
                                cartQty.quantity,
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        CartQtyUpdation(
                            cartQty: cartQty, productId: product.id!)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '\$$finalAmount',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, userState) {
                          return TextButton(
                            onPressed: () async{
                              await RemoveFromCartImplementation().removeFromCart(
                                  userState.user.userId, product.id!, context);
                            },
                            child: const Text(
                              'Remove',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
