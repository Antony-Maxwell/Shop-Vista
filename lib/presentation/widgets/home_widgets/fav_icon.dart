import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/get_wishlist/getwishlist_bloc.dart';
import 'package:shop_vista/application/home/wishlist/wishlist_bloc.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/wishlist/add_to_wishlist_impl.dart';

class TFavIcon extends StatelessWidget {
  final String productId;
  final String userId;
  final Color iconColortemp;

  const TFavIcon({
    Key? key,
    required this.productId,
    required this.userId,
    required this.iconColortemp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        IconData iconData = Iconsax.heart5; // Default icon
        Color iconColor = Colors.grey;


        if (state is WishlistInitial && state.wishlistIcons.containsKey(productId)) {
          iconData = state.wishlistIcons[productId]!;
          iconColor = Colors.red;
        }

        return Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              final wishlistBloc = BlocProvider.of<WishlistBloc>(context);
              if (state is WishlistInitial && state.wishlistIcons.containsKey(productId)) {
                wishlistBloc.add(ToggleWishlist(productId));
               AddToWishlist().setWishlist(userId, productId, context);
              } else {
                wishlistBloc.add(ToggleWishlist(productId));
                AddToWishlist().setWishlist(userId, productId, context);
              }
            },
            child: Icon(
              iconData,
              color: iconColortemp,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}
