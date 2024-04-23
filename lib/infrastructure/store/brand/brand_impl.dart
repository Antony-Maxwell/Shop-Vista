import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/brand/brand_service.dart';
import 'package:shop_vista/domain/home/brand/model/brand_model.dart';

@LazySingleton(as: BrandServices)
class BrandsImplements implements BrandServices {
  final _db = FirebaseFirestore.instance;
  @override
  Future<Either<MainFailure, List<BrandModel>>> getBrands() async {
    try {
      final snapShot = await _db.collection('Brand').get();
      final List<BrandModel> retrievedBrands = snapShot.docs
          .map((doc) => BrandModel.fromJson(doc.data()))
          .toList();
      print(retrievedBrands);
      return Right(retrievedBrands);
        } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
