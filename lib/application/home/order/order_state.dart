part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class PaymentSuccessState extends OrderState {
  final bool isSuccess;

  PaymentSuccessState(this.isSuccess);
}