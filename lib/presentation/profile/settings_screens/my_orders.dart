import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/profile/Orders/orders_bloc.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/presentation/profile/widgets/order_container.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Orders",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.isLoading) {
              return ShimmerProduct().buildShimmerEffectCategory();
            } else if (state.user.orders.isEmpty) {
              BlocProvider.of<OrdersBloc>(context).add(OrdersEvent.getOrdersList(state.user.userId));
              return Center(
                  child: SizedBox(
                height: 700,
                width: double.infinity,
                child: Column(
                  children: [
                    Lottie.network("https://lottie.host/6b707dcc-3eb6-46eb-b6bf-b2b667825d26/OHl5GI3p2A.json"),
                    const Text('No orders found.!')
                  ],
                ),
              ));
            }
            return BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, orderstate) {
                if(orderstate.isLoading){
                  return SizedBox();
                }
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderstate.orders!.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(height: 10,),
                        itemBuilder: (context, index) {
                          final order = orderstate.orders![index];
                        return OrderContainer(order: order);
                        }
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
