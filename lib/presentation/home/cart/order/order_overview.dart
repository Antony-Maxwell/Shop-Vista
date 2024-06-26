import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/cart/cart_container/cart_container.dart';
import 'package:shop_vista/presentation/home/cart/order/widgets/order_overview_checkout.dart';
import 'package:shop_vista/presentation/home/cart/order/widgets/payment_address.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';

class OrderOverView extends StatelessWidget {
  const OrderOverView(
      {super.key, required this.userId, required this.amountTotal});
  final userId;
  final double amountTotal;

  @override
  Widget build(BuildContext context) {
    const int shippingfee = 12;
    const int discountamt = 20;
    const int tax = 3;
    const int total = shippingfee + discountamt + tax;
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
                      } else if (state.cart!.isEmpty) {
                        return const Text('Cart is empty..');
                      } else {
                        final List<Cart> cartProductsQty = state.cart!;
                        final List<Products> cartProducts =
                            productState.productsList.where((product) {
                          return state.cart!.any(
                              (cartItem) => cartItem.productId == product.id);
                        }).toList();
                        double totalPrice = cartProducts.fold(
                          0,
                          (total, product) => total + product.price!,
                        );
                        double finalAmount = 0; // Initialize finalAmount
                        for (int i = 0; i < cartProducts.length; i++) {
                          final product = cartProducts[i];
                          final cartQty = cartProductsQty[i];
                          finalAmount += (product.price ?? 0) *
                              int.parse(cartQty.quantity);
                        }
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: CartContainer(
                                cartProducts: cartProducts,
                                state: state,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: BlocBuilder<UserBloc, UserState>(
                                  builder: (context, userState) {
                                    final amount = state.totalPrice;
                                    final address = userState.user.addresses;
                                    if (address.isEmpty) {
                                      return PaymentAndAddress(
                                        totalPrice: state.totalPrice,
                                        shippingfee: shippingfee,
                                        tax: tax,
                                        discountamt: discountamt,
                                        total: total,
                                        address: Address(
                                            name: '',
                                            street: '',
                                            city: '',
                                            state: '',
                                            postalCode: '',
                                            country: '',
                                            phoneNumber: 0),
                                        userState: userState,
                                        isAddressEmpty: true,
                                      );
                                    }
                                    return PaymentAndAddress(
                                      totalPrice: amountTotal,
                                      shippingfee: shippingfee,
                                      tax: tax,
                                      discountamt: discountamt,
                                      total: total,
                                      address: address[0],
                                      userState: userState,
                                      isAddressEmpty: false,
                                    );
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
        bottomNavigationBar: BlocBuilder<GetCartBloc, GetCartState>(
          builder: (context, state) {
            if(state.cart!.isEmpty){
              return const OrderOverviewCheckout(total: 0);
            }
            return const OrderOverviewCheckout(total: total);
          },
        ));
  }
}
