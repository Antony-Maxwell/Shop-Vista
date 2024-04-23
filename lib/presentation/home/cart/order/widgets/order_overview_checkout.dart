import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/infrastructure/upi/upi_integration.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/checkout_container.dart';
import 'package:uuid/uuid.dart';

class OrderOverviewCheckout extends StatelessWidget {
  const OrderOverviewCheckout({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              final orderId = generateOrderId();
              print(orderId);
              return BlocBuilder<GetCartBloc, GetCartState>(
                builder: (context, state) {
                  return BlocBuilder<UserBloc, UserState>(
                    builder: (context, userstate) {
                      return UpiBottomSheet(
                        userId: userstate.user.userId,
                        cartItems: state.cart!,
                        orderId: orderId,
                      );
                    },
                  );
                },
              );
            },
          );
        },
        child: CheckoutContainer(
          checkoutVal: total,
          isCheckout: true,
        ));
  }

  String generateOrderId() {
    var uuid = Uuid();
    return uuid.v4();
  }
}
