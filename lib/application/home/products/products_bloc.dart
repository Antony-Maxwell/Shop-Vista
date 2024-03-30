import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/domain/home/products/products_services.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsServices _prodService;
  ProductsBloc(this._prodService) : super(ProductsState.initial()) {
    on<LoadProductDetails>((event, emit) async{
      emit(const ProductsState(productsList: [], isLoading: true, hasError: false));
      final _result = await _prodService.getProductsData();
      final newState = _result.fold((MainFailure failure) {
        return const ProductsState(productsList: [], isLoading: false, hasError: true);
      }, (List<Products> resp) {
        return ProductsState(productsList: resp, isLoading: false, hasError: false);
      });
      emit(newState);
      
    });
  }
}
