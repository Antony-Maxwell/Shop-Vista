import 'package:dartz/dartz.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';

abstract class BrandServices{
  Future<Either<MainFailure, List<BrandModel>>> getBrands();
}