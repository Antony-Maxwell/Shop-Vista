part of 'get_cart_bloc.dart';

@freezed
class GetCartEvent with _$GetCartEvent{
  const factory GetCartEvent.getCartList(String userId, double totalPrice, double orderTotal) = GetCartList;
}
