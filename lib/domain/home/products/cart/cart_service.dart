import 'package:dartz/dartz.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

abstract class CartService{
  Future<Either<MainFailure,Cart>> setCart(String userId, String productId, String quantity);
}