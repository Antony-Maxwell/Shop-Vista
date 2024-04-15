import 'package:dartz/dartz.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';

abstract class ProductsServices {
  Future<Either<MainFailure, List<Products>>> getProductsData();
}
