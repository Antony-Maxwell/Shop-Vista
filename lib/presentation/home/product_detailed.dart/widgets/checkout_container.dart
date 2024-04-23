import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer({
    this.checkoutVal,
    required this.isCheckout,
    super.key,
  });

  final bool? isCheckout;
  final checkoutVal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(1.1, 1.1),
              blurRadius: 5.0,
              spreadRadius: 1.0)
        ], color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        height: 50,
        child: Center(
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, proState) {
              if (proState.isLoading) {
                return const CircularProgressIndicator();
              }
              return BlocBuilder<GetCartBloc, GetCartState>(
                builder: (context, state) {
                  return isCheckout!
                      ? Text(
                          'CheckOut \$${state.totalPrice + checkoutVal}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      : Text(
                          'CheckOut \$${state.totalPrice}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
