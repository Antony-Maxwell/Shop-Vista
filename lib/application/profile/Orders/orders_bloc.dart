import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_vista/domain/User/orders/order_service.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersService _getOrdersService;
  OrdersBloc(this._getOrdersService) : super(OrdersState.initial()) {
    on<GetOrdersList>((event, emit) async{
      emit(
        state.copyWith(
          isLoading: true,
          ordersSuccessFRailureOption: none(),
        )
      );
      final Either<MainFailure, List<Orders>> ordersOption = await _getOrdersService.getOrders(event.userId);
      emit(
        ordersOption.fold((failure){
          return state.copyWith(
            isLoading: false,
            ordersSuccessFRailureOption: Some(Left(failure)),
          );
        }, (success){
          return state.copyWith(
            isLoading: false,
            orders: success,
            ordersSuccessFRailureOption: Some(Right(success)),
          );
        })
      );
    });
  }
}
