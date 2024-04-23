import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';

class RemoveFromCartImplementation{
  Future<Either<MainFailure, Cart>> removeFromCart(String userId, String productId, BuildContext context) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;
      List<Map<String, dynamic>>? cart = List<Map<String, dynamic>>.from(userData?['Cart'] ?? []);
      int existingProductIndex = cart.indexWhere((item) => item['ProductId'] == productId);

      if (existingProductIndex != -1) {
        cart.removeAt(existingProductIndex); // Remove the item from the cart list
        CustomSnackBar().showSuccessSnackBar(context, 'Product removed successfully');
      } else {
        CustomSnackBar().showErrorSnackBar(context,'Product failed to remove');
      }

      Map<String, dynamic> updatedData = {'Cart': cart};

      await userDocRef.update(updatedData);

      return Right(Cart(productId: productId, quantity: '0')); // Return a placeholder Cart object
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }
}