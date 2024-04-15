
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/infrastructure/upi/upi_integration.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/checkout_container.dart';

class OrderOverviewCheckout extends StatelessWidget {
  const OrderOverviewCheckout({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const UpiBottomSheet(
            orderId: 'akfjbaeba',
          );
        },
      );
    }, child: BlocBuilder<ProductsBloc, ProductsState>(
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
          return CheckoutContainer(
            checkoutVal: totalPrice + total,
            isCheckout: false,
          );
        }
      });
    }));
  }
}
