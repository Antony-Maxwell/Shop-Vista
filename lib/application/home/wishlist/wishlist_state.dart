part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {
  final Map<String, IconData> wishlistIcons;

  WishlistInitial(this.wishlistIcons);
}