import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial(const {})) {
    // Register the handler for ToggleWishlist event
    on<ToggleWishlist>((event, emit) {
      final currentState = state as WishlistInitial;
      final Map<String, IconData> newWishlistIcons = Map.from(currentState.wishlistIcons);

      // Toggle the icon for the given product ID
      if (newWishlistIcons.containsKey(event.productId)) {
        newWishlistIcons.remove(event.productId);
      } else {
        newWishlistIcons[event.productId] = Iconsax.heart5;
      }
      emit(WishlistInitial(newWishlistIcons));
    });
  }
}
