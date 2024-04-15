import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/infrastructure/emailandpass_auth_impl/firebase_auth_service.dart';
import 'package:shop_vista/presentation/home/cart/cart_container/cart_container.dart';
import 'package:shop_vista/presentation/home/cart/order/order_overview.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/checkout_container.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetCartBloc>(context)
          .add(GetCartEvent.getCartList(userId,0.0));
    });
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, productState) {
            return BlocBuilder<GetCartBloc, GetCartState>(
              builder: (context, state) {
                if (productState.isLoading && state.isLoading) {
                  return const CircularProgressIndicator();
                } else if (state.cart == null) {
                  return const Text('Cart is empty..');
                } else {
                  final List<Products> cartProducts =
                      productState.productsList.where((product) {
                    return state.cart!
                        .any((cartItem) => cartItem.productId == product.id);
                  }).toList();
                  double totalPrice = cartProducts.fold(
                    0,
                    (total, product) => total + product.price!,
                  );
                  BlocProvider.of<GetCartBloc>(context)
                      .add(GetCartEvent.getCartList(userId, totalPrice));
                  return CartContainer(
                    isNeedtoShow: true,
                    cartProducts: cartProducts,
                    state: state,
                  );
                }
              },
            );
          },
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrderOverView(userId: userId,),)),
        child:const CheckoutContainer(
          isCheckout: true,
        ),
      ),
    );
  }
}