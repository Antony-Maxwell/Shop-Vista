import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shop_vista/application/home/get_cart/get_cart_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
    required this.userId,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userstate) {
        if(userstate.isLoading){
          return const LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
                strokeWidth: 2,
              );
        }else{
          BlocProvider.of<GetCartBloc>(context)
        .add(GetCartEvent.getCartList(userstate.user.userId, 0.0, 0.0));
        }
        return BlocBuilder<GetCartBloc, GetCartState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
                strokeWidth: 2,
              );
            } else if (state.cart == null) {
              return const LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
                strokeWidth: 2,
              );
            }
            final count = state.cart!.length;
            return Stack(
              children: [
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Iconsax.shopping_bag,
                      color: iconColor,
                    )),
                    if(count != 0)
                Positioned(
                  right: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        count.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                )
                else SizedBox(),
              ],
            );
          },
        );
      },
    );
  }
}
