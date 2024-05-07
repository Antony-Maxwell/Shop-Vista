import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/get_quantity/get_quantity_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/store/cart_quantity/cart_count_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/cart/add_cart_cartscreen.dart';

class CartQtyUpdation extends StatefulWidget {
  const CartQtyUpdation({
    super.key,
    required this.cartQty,
    required this.productId,
  });

  final Cart cartQty;
  final String productId;

  @override
  State<CartQtyUpdation> createState() => _CartQtyUpdationState();
}

class _CartQtyUpdationState extends State<CartQtyUpdation> {
  late int qty;
  @override
  void initState() {
    qty = int.parse(widget.cartQty.quantity);
    super.initState();
  }

  void _incrementQty() {
    setState(() {
      qty++;
    });
  }

  void _decrementQty() {
    if (qty > 0) {
      setState(() {
        qty--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartBloc, GetCartState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Row(
              children: [
                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade700,
                                  ),
                                  child: Row(
                children: [
                  GestureDetector(
                    onTap: ()async{
                      _decrementQty();
                      await AddToCartImplementationCartScreen().setCart(
                        state.user.userId,
                        widget.productId,
                        qty.toString(),
                        context,
                        widget.cartQty.size,
                        widget.cartQty.color,
                      );
                    },
                    child: Container(
                      width: 28,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 30,
                    child: Center(child: Text('$qty')),
                  ),
                  GestureDetector(
                      onTap: () async {
                        _incrementQty();
                        await AddToCartImplementationCartScreen().setCart(
                          state.user.userId,
                          widget.productId,
                          qty.toString(),
                          context,
                          widget.cartQty.size,
                          widget.cartQty.color,
                        );
                        log(qty.toString());
                        log(widget.productId);
                      },
                      child: Container(
                        width: 28,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
                ],
                                  ),
                                ),
              ],
            );
          },
        );
      },
    );
  }
}
