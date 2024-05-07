
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';

class AddToCartImplementation{
  Future<Either<MainFailure, Cart>> setCart(String userId, String productId, String quantity, BuildContext context, String size, String color) async {
    print(quantity);
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;
      List<Map<String, dynamic>>? cart = List<Map<String, dynamic>>.from(userData?['Cart'] ?? []);
      int existingProductIndex = cart.indexWhere((item) => item['ProductId'] == productId);

      if (existingProductIndex != -1) {
        CustomSnackBar().showErrorSnackBar(context, 'Product already in cart!..');
      } else {
        cart.add({'ProductId': productId, 'Quantity': quantity, 'Size' : size, 'Color' : color});
        CustomSnackBar().showSuccessSnackBar(context, 'Yeah Product added to cart');
      }

      Map<String, dynamic> updatedData = {'Cart': cart};

      await userDocRef.update(updatedData);

      final carti = Cart(productId: productId, quantity: quantity, color: color, size: size);
      log(carti.productId);
      return Right(Cart(productId: productId, quantity: quantity, color: color, size: size));
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }
}
