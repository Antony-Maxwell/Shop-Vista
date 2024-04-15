part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required List<Products> productsList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory ProductsState.initial() => const ProductsState(
        hasError: false,
        isLoading: false,
        productsList: [],
      );
}
