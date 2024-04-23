import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_vista/domain/User/cart/cart_service.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

part 'get_cart_event.dart';
part 'get_cart_state.dart';
part 'get_cart_bloc.freezed.dart';

@injectable
class GetCartBloc extends Bloc<GetCartEvent, GetCartState> {
  final GetCartService _getCartService;
  GetCartBloc(this._getCartService) : super(GetCartState.initial()) {
    on<GetCartList>((event, emit)async {
      emit(
        state.copyWith(
          isLoading: true,
          cartSuccessFailureOption: none(),
        ),
      );
      final Either<MainFailure,List<Cart>> cartOptions = await _getCartService.getCarts(event.userId);
      emit(
        cartOptions.fold((failure){
          return state.copyWith(
            isLoading: false,
            cartSuccessFailureOption: Some(Left(failure)),
          );
        }, (success) {
          return state.copyWith(
            isLoading: false,
            cart: success,
            totalPrice: event.totalPrice,
            cartSuccessFailureOption: Some(Right(success)),
          );
        })
      );
    });
  }
}
