import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/brand/brand_service.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';

part 'brand_event.dart';
part 'brand_state.dart';
part 'brand_bloc.freezed.dart';

@injectable
class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandServices _brandServices;
  BrandBloc(this._brandServices) : super(BrandState.initial()) {
    on<GetBrandsList>((event, emit) async{
      emit(
        state.copyWith(
          isLoading: true,
          brandsSuccessFailureOption: none(),
        ),
      );
      final Either<MainFailure, List<BrandModel>> brandOptions = await _brandServices.getBrands();
      emit(
        brandOptions.fold((failure) {
          return state.copyWith(
            isLoading: false,
            brandsSuccessFailureOption: Some(Left(failure)),
          );
        }, (success) {
          return state.copyWith(
            isLoading: false,
            brands: success,
            brandsSuccessFailureOption: Some(Right(success))
          );
        })
      );
    });
  }
}
