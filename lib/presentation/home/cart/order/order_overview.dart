import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/cart/cart_container/cart_container.dart';
import 'package:shop_vista/presentation/home/cart/order/widgets/coupon_code.dart';
import 'package:shop_vista/presentation/home/cart/order/widgets/order_overview_checkout.dart';
import 'package:shop_vista/presentation/home/cart/order/widgets/payment_address.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';

class OrderOverView extends StatelessWidget {
  const OrderOverView({super.key, required this.userId});
  final userId;

  @override
  Widget build(BuildContext context) {
    const int shippingfee = 12;
    const int discountamt = 25;
    const int tax = 3;
    const int total = shippingfee + discountamt + tax;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetCartBloc>(context)
          .add(GetCartEvent.getCartList(userId, 0.0));
    });
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            'Order Overview',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
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
                          return state.cart!.any(
                              (cartItem) => cartItem.productId == product.id);
                        }).toList();
                        double totalPrice = cartProducts.fold(
                          0,
                          (total, product) => total + product.price!,
                        );
                        BlocProvider.of<GetCartBloc>(context)
                            .add(GetCartEvent.getCartList(userId, totalPrice));
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: CartContainer(
                                isNeedtoShow: false,
                                cartProducts: cartProducts,
                                state: state,
                              ),
                            ),
                            const CouponCodeContainer(),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              height: 570,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: BlocBuilder<UserBloc, UserState>(
                                  builder: (context, userState) {
                                    final address = userState.user.address;
                                    return PaymentAndAddress(totalPrice: totalPrice, shippingfee: shippingfee, tax: tax, discountamt: discountamt, total: total, address: address, userState: userState,);
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: const OrderOverviewCheckout(total: total));
  }
}
