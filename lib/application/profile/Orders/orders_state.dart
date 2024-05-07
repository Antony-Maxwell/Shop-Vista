part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState{
  const factory OrdersState({
    required bool isLoading,
    List<Orders>? orders,
    required Option<Either<MainFailure, List<Orders>>> ordersSuccessFRailureOption,
  }) = _OrdersState;

  factory OrdersState.initial() => const OrdersState(
    isLoading: false,
    ordersSuccessFRailureOption: None(),
  );
}

