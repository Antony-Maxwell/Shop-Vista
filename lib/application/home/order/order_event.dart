part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class PaymentSuccessEvent extends OrderEvent {
  final bool isSuccess;

  PaymentSuccessEvent(this.isSuccess,);
}
