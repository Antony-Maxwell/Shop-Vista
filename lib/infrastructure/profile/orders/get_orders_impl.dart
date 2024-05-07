import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/User/orders/order_service.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

@LazySingleton(as: GetOrdersService)
class GetOrdersImplementation implements GetOrdersService{
  @override
  Future<Either<MainFailure, List<Orders>>> getOrders(String userId) async{
    try{
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;

      if(userData != null && userData.containsKey('Orders')){
        List<dynamic> ordersData = userData['Orders'];
        List<Orders> orders = ordersData.map((order) => Orders.fromJson(order)).toList();
        print(orders);
        return Right(orders);
      }else{
        return const Right([]);
      }
    }catch (e){
      return const Left(MainFailure.serverFailure());
    }
  }

}