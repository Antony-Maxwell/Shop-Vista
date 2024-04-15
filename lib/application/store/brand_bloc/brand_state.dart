part of 'brand_bloc.dart';

@freezed
class BrandState with _$BrandState{
  const factory BrandState({
    required bool isLoading,
    List<BrandModel>? brands,
    required Option<Either<MainFailure, List<BrandModel>>> brandsSuccessFailureOption,
  }) = _BrandState;

  factory BrandState.initial() => const BrandState(
    isLoading: false,
    brandsSuccessFailureOption: None(),
  );
}

