import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/User/wishlist/wishlist_service.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

@LazySingleton(as: GetWishlistService)
class GetWishlistImplementation implements GetWishlistService {
  @override
  Future<Either<MainFailure, List<String>>> getWishlist(String userId) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');
      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData =
          userDocSnapshot.data() as Map<String, dynamic>?;

      if (userData != null && userData.containsKey('Wishlist')) {
        List<dynamic>? wishlistData = userData['Wishlist'];
        if (wishlistData != null) {
          List<String> wishlist =
              wishlistData.map((item) => item.toString()).toList();
              print(wishlist);
          return Right(wishlist);
        } else {
          return const Right([]);
        }
      } else {
        return const Right([]);
      }
    } on FirebaseException {
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      // Handle generic error
      return const Left(MainFailure.serverFailure());
    }
  }
}
