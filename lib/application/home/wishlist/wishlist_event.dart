part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class ToggleWishlist extends WishlistEvent {
  final String productId;

  ToggleWishlist(this.productId);
}

class ToggleToUnlist extends WishlistEvent{
  final String productId;

  ToggleToUnlist(this.productId);
}
