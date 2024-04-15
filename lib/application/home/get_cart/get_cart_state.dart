part of 'get_cart_bloc.dart';

@freezed
class GetCartState with _$GetCartState{
  const factory GetCartState({
    required bool isLoading,
    List<Cart>? cart,
    required double totalPrice,
    required Option<Either<MainFailure, List<Cart>>> cartSuccessFailureOption,
  }) = _GetCartState;

  factory GetCartState.initial() => const GetCartState(
    isLoading: false,
    cartSuccessFailureOption: None(),
    totalPrice: 0.0,
  );
}

