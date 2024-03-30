import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/banners/banners_respository.dart';
import 'package:dartz/dartz.dart';

abstract class BannersRepo{
  Future<Either<MainFailure,List<Banners>>> getBannersImage();
}