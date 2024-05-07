import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/color_choicechip/choice_chip_color_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/get_quantity/get_quantity_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/size_choicechip/size_choice_chip_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/store/cart_quantity/cart_count_bloc.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/cart/add_to_cart_impl.dart';

class TBottomAddtoCart extends StatelessWidget {
  const TBottomAddtoCart({
    super.key,
    required this.productId, required this.height, required this.width, required this.isCart, required this.iconSize, this.qty, required this.padding, required this.isDialog
  });

  final productId;
  final double height;
  final double width;
  final bool isCart;
  final double iconSize;
  final String? qty;
  final double padding;
  final bool isDialog;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 1),
      decoration: BoxDecoration(
          color: dark ? Colors.grey : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: isDialog
          ?
          BorderRadius.circular(10)
          :
           const BorderRadius.only(
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
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: dark
                ? Colors.white
                :
                Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Icon(Icons.remove, size: iconSize, color: dark ? Colors.black : Colors.white,)),
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
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
                size: iconSize,
              )),
            ),
          ),
          SizedBox(width: 5,),
          const Spacer(),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, productState) {
                  return BlocBuilder<CartCountBloc, CartCountState>(
                    builder: (context, cartCounterState) {
                      return BlocBuilder<SizeChoiceChipBloc,
                          SizeChoiceChipState>(
                        builder: (context, sizeState) {
                          return BlocBuilder<ChoiceChipColorBloc,
                              ChoiceChipColorState>(
                            builder: (context, colorState) {
                              return BlocBuilder<GetCartBloc, GetCartState>(
                                builder: (context, cartState) {
                                  return GestureDetector(
                                    onTap: () async {
                                      log(state.user.userId);
                                      log(productId);
                                      log('${cartCounterState.cartCount}');
                                      final colorCount = colorState.selectedIndex;
                                      await AddToCartImplementation().setCart(
                                          state.user.userId,
                                          productId,
                                          cartCounterState.cartCount.toString(),
                                          context,
                                          sizeState.selectedValue,
                                          colorState.selectedValue,
                                          );
                                      context
                                          .read<CartCountBloc>()
                                          .add(ResetCart());
                                    },
                                    child:
                                    isCart
                                    ? SizedBox(width: 1,)
                                    : Container(
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
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
