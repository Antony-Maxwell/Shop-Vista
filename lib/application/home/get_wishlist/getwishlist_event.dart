part of 'getwishlist_bloc.dart';

@freezed
class GetwishlistEvent with _$GetwishlistEvent{
  const factory GetwishlistEvent.getWishlist(String userId) = GetWishlist;
}
