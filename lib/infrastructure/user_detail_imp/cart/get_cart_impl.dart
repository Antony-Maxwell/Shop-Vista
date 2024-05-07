import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/User/cart/cart_service.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

@LazySingleton(as: GetCartService)
class GetCartImplementation implements GetCartService {
  @override
  Future<Either<MainFailure, List<Cart>>> getCarts(String userId) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;

      if (userData != null && userData.containsKey('Cart')) {
        List<dynamic> cartData = userData['Cart'];
        List<Cart> cart = cartData.map((item) => Cart.fromJson(item)).toList();
        return Right(cart);
      } else {
        return const Right([]);
      }
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }
}
