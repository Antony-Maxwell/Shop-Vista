import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/store/cart_quantity/cart_count_bloc.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/cart/add_to_cart_impl.dart';

class TBottomAddtoCart extends StatelessWidget {
  const TBottomAddtoCart({
    super.key,
    required this.productId,
  });

  final productId;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: dark ? Colors.grey : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (BlocProvider.of<CartCountBloc>(context).state.cartCount <=
                  0) {
                return;
              } else {
                BlocProvider.of<CartCountBloc>(context).add(Decrement());
              }
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(child: Icon(Icons.remove)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartCountBloc, CartCountState>(
            builder: (context, state) {
              return Text(
                '${state.cartCount}',
                style: const TextStyle(
                  fontSize: 17,
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<CartCountBloc>(context).add(Increment());
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
              )),
            ),
          ),
          const Spacer(),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, productState) {
                  return BlocBuilder<CartCountBloc, CartCountState>(
                    builder: (context, cartCounterState) {
                      return GestureDetector(
                        onTap: () async {
                          AddToCartImplementation().setCart(state.user.userId!, productId, cartCounterState.cartCount.toString(), context, 'EU 34', 'Blue');
                        },
                        child: Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Wrap(
                            children: [
                              const Icon(Iconsax.shopping_bag),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add to bag',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          )),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
