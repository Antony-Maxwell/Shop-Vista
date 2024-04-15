import 'package:dartz/dartz.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

abstract class GetWishlistService{
  Future<Either<MainFailure, List<String>>> getWishlist(String userId);
}