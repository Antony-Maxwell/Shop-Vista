import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';

class AddAddressImplementation{
  Future<Either<MainFailure, Address>> addAddress (String userId, String name, String street, String city, String state, String postalCode, String country, int phoneNumber)async{
    try{
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;
      List<Map<String, dynamic>>? addressFromDb = List<Map<String, dynamic>>.from(userData?['Addresses']??[]);

      addressFromDb.add({
        'Name': name,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'PhoneNumber': phoneNumber,
      });

      Map<String, dynamic> updatedData = {'Addresses' : addressFromDb};

      await userDocRef.update(updatedData);
      return Right(Address(name: name, street: street, city: city, state: state, postalCode: postalCode, country: country, phoneNumber: phoneNumber));
    }catch (e){
      return const Left(MainFailure.serverFailure());
    }
  }
}