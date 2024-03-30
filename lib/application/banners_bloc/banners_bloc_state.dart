part of 'banners_bloc_bloc.dart';

@freezed
class BannersState with _$BannersState{
  const factory BannersState({
    required bool isLoading,
    List<Banners>? banners,
    required Option<Either<MainFailure,List<Banners>>> bannersSuccessFailureOption,
  }) = _BannersState;

  factory BannersState.initial() => BannersState(
      isLoading: false,
      bannersSuccessFailureOption: None(),
      );
}