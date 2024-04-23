import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/banners/banners_respository.dart';
import 'package:shop_vista/domain/home/banners/banners_repo.dart';

part 'banners_bloc_event.dart';
part 'banners_bloc_state.dart';
part 'banners_bloc_bloc.freezed.dart';

@injectable
class BannersBlocBloc extends Bloc<BannersEvent, BannersState> {
  final BannersRepo _bannersRepo;
  BannersBlocBloc(this._bannersRepo) : super(BannersState.initial()) {
    on<GetBannersImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          bannersSuccessFailureOption: none(),
        ),
      );
      final Either<MainFailure, List<Banners>> bannersOption =
          await _bannersRepo.getBannersImage();
      // print(bannersOption.toString());
      emit(bannersOption.fold((failure) {
        return state.copyWith(
            isLoading: false, bannersSuccessFailureOption: Some(Left(failure)));
      }, (success) {
        return state.copyWith(
            isLoading: false,
            banners: success,
            bannersSuccessFailureOption: Some(Right(success)));
      }));
    });
  }
}
