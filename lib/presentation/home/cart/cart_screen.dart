import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/cart/cart_container/cart_container.dart';
import 'package:shop_vista/presentation/home/cart/order/order_overview.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/checkout_container.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/no_user_dialog.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetCartBloc>(context)
          .add(GetCartEvent.getCartList(userId, 0.0, 0.0));
    });
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, productState) {
                  return BlocBuilder<GetCartBloc, GetCartState>(
                    builder: (context, state) {
                      if (productState.isLoading && state.isLoading) {
                        return const CircularProgressIndicator();
                      } else if (state.cart!.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 150,
                              ),
                              SizedBox(
                                height: 270,
                                child: Image.asset(
                                  "assets/empty-cart-ecommerce-3d-icon-png.png",
                                ),
                              ),
                              const Text('Your cart is empty...!'),
                            ],
                          ),
                        );
                      } else {
                        final List<Cart> cartProductsQty = state.cart!;
                        final List<Products> cartProducts =
                            cartProductsQty.map((cartItem) {
                          final productIndex =
                              productState.productsList.indexWhere(
                            (product) => product.id == cartItem.productId,
                          );
                          if (productIndex == -1) {
                            return Products();
                          }
                          return productState.productsList[productIndex];
                        }).toList();
                        double finalAmount = 0; // Initialize finalAmount
                        for (int i = 0; i < cartProducts.length; i++) {
                          final product = cartProducts[i];
                          final cartQty = cartProductsQty[i].quantity;
                          finalAmount +=
                              (product.salePrice ?? 0) * int.parse(cartQty);
                        }
                        BlocProvider.of<GetCartBloc>(context).add(
                            GetCartEvent.getCartList(userId, finalAmount, 0.0));
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BlocBuilder<GetCartBloc, GetCartState>(
                            builder: (context, cartState) {
                              return CartContainer(
                                cartProducts: cartProducts,
                                state: cartState,
                              );
                            },
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          if(userState.user.userName.isEmpty){
            return MyDialog();
          }else{
          return BlocBuilder<GetCartBloc, GetCartState>(
            builder: (context, state) {
              if (state.cart!.isNotEmpty) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BlocBuilder<GetCartBloc, GetCartState>(
                          builder: (context, state) {
                            return OrderOverView(
                              amountTotal: state.totalPrice,
                              userId: userId,
                            );
                          },
                        ),
                      )),
                  child: const CheckoutContainer(
                    isCheckout: false,
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          );
          }
        },
      ),
    );
  }
}
