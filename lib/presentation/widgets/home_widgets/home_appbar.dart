import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/presentation/home/cart/cart_screen.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/product_cart/cart_menu_icon.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TAppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day for shopping',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: Colors.white),
              ),
              Text(
                state.user.userName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white),
              ),
            ],
          ),
          action: [
            TCartCounterIcon(
              userId: state.user.userId,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      print(' user id is ------------- ${state.user.userId}');
                      return CartScreen(
                      userId: state.user.userId!,
                    );
                    }
                  )),
              iconColor: Colors.white,
            )
          ],
        );
      },
    );
  }
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}
