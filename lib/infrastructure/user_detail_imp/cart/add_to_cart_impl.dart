
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';

class AddToCartImplementation{
  Future<Either<MainFailure, Cart>> setCart(String userId, String productId, String quantity, BuildContext context, String size, String color) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;
      List<Map<String, dynamic>>? cart = List<Map<String, dynamic>>.from(userData?['Cart'] ?? []);
      int existingProductIndex = cart.indexWhere((item) => item['ProductId'] == productId);

      if (existingProductIndex != -1) {
        cart[existingProductIndex]['Quantity'] = quantity;
        CustomSnackBar().showErrorSnackBar(context, 'Product already in cart!..');
      } else {
        cart.add({'ProductId': productId, 'Quantity': quantity, 'Size' : size, 'Color' : color});
        CustomSnackBar().showSuccessSnackBar(context, 'Yeah Product added to cart');
      }

      Map<String, dynamic> updatedData = {'Cart': cart};

      await userDocRef.update(updatedData);

      return Right(Cart(productId: productId, quantity: quantity));
    } catch (e) {
      return Left(MainFailure.serverFailure());
    }
  }
}
