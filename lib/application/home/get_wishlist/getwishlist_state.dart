part of 'getwishlist_bloc.dart';

@freezed
class GetwishlistState with _$GetwishlistState{
  const factory GetwishlistState({
    required bool isLoading,
    List<String>? wishList,
    required Option<Either<MainFailure, List<String>>> wishlistSuccessorFailure,

  }) = _GetwishlistState;

  factory GetwishlistState.initial() => const GetwishlistState(
    isLoading: true,
    wishlistSuccessorFailure: None(),
  );
}

