import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/home/banners/banners_respository.dart';
import 'package:shop_vista/domain/home/banners/banners_repo.dart';

@LazySingleton(as: BannersRepo)
class BannersRepository implements BannersRepo {
  final _db = FirebaseFirestore.instance;
  @override
  Future<Either<MainFailure, List<Banners>>> getBannersImage() async {
    try {
      final snapShot = await _db.collection('Banners').get();
      // final Response response = await Dio(BaseOptions()).get(ApiEndpoints.banners);
      final bannersList = snapShot.docs
          .map((document) => Banners.fromSnapshot(document))
          .toList();
      // print(bannersList);
      return Right(bannersList);
        } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
