part of 'cart_count_bloc.dart';

class CartCountState {
  final int cartCount;

  CartCountState({required this.cartCount});
}

class CartCountInitial extends CartCountState {
  CartCountInitial() : super(cartCount: 0);
}
