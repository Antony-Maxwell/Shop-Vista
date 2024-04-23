import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
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
            if(state.isLoading){
              return ShimmerProduct().buildShimmerEffectCategory();
            }else if(state.user.orders.isEmpty){
              return Center(child: SizedBox(
                height: 700,
                width: double.infinity,
                child: Lottie.asset("assets/empty_orders.json"),
                ));
            }
            return Column(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
