import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/User/wishlist/wishlist_service.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'getwishlist_event.dart';
part 'getwishlist_state.dart';
part 'getwishlist_bloc.freezed.dart';

@injectable
class GetwishlistBloc extends Bloc<GetwishlistEvent, GetwishlistState> {
  final GetWishlistService _getWishlistService;
  GetwishlistBloc(this._getWishlistService) : super(GetwishlistState.initial()) {
    on<GetWishlist>((event, emit) async{
      emit(
        state.copyWith(
          isLoading: true,
          wishlistSuccessorFailure: none(),
        ),
      );
      final Either<MainFailure, List<String>> wishlistOption = await _getWishlistService.getWishlist(event.userId);
      emit(
        wishlistOption.fold((failure){
          return state.copyWith(
            isLoading: false,
            wishlistSuccessorFailure: Some(left(failure)),
          );
        }, (success){
          return state.copyWith(
            isLoading: false,
            wishList: success,
            wishlistSuccessorFailure: Some(Right(success)),
          );
        } )
      );
    });
  }
}
