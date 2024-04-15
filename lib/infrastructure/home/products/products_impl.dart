import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/domain/home/products/products_services.dart';

@LazySingleton(as: ProductsServices)
class ProductsImplementation implements ProductsServices {
  final _db = FirebaseFirestore.instance;
  @override
  Future<Either<MainFailure, List<Products>>> getProductsData() async {
    try {
      final snapShot = await _db.collection('Products').get();
      // final Response response = await Dio(BaseOptions()).get(ApiEndpoints.banners);
      if (snapShot != null) {
        final productList = snapShot.docs
            .map((document) => Products.fromJson(document.data()))
            .whereType<Products>()
            .toList();
        print(productList);
        productList.forEach((element) {
          print(element.price);
          print(element.thumbnail);
          print(element.id);
        });
        return Right(productList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
