import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/User/users_repository.dart';
import 'package:shop_vista/domain/core/main_failures.dart';


@LazySingleton(as:UsersService )
class UserDetailsImplementation implements UsersService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<Either<MainFailure, UserModel>> getUserDetails()async {
    try{
      User? user = _auth.currentUser;

      if(user != null){
        QuerySnapshot querySnapshot = await firestore.collection('Users').where('UserId', isEqualTo: user.uid).get();
        if(querySnapshot.docs.isNotEmpty){
          Map<String,dynamic> userData = querySnapshot.docs[0].data() as Map<String,dynamic>;
          UserModel userModel = UserModel.fromJson(userData);
          print(userModel);
          return Right(userModel);
        }else{
          print('No document found for the current user');
          return const Left(MainFailure.clientFailure());
        }
      }else{
        print('no user is currently logged in');
        return const Left(MainFailure.clientFailure());
      }
    }catch (e){
      return const Left(MainFailure.serverFailure());
    }
  }

}