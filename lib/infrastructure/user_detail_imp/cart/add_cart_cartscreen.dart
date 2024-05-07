
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';

class AddToCartImplementationCartScreen {
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
        // Parse existing quantity as integer
        int existingQuantity = int.tryParse(cart[existingProductIndex]['Quantity'] ?? '0') ?? 0;
        // Parse new quantity as integer
        int newQuantity = int.tryParse(quantity) ?? 0;
        // Update quantity by adding new quantity to existing quantity
        cart[existingProductIndex]['Quantity'] = (newQuantity).toString();
        CustomSnackBar().showSuccessSnackBar(context, 'Quantity updated');
      } else {
        cart.add({'ProductId': productId, 'Quantity': quantity, 'Size': size, 'Color': color});
        CustomSnackBar().showSuccessSnackBar(context, 'Product added to cart');
      }

      Map<String, dynamic> updatedData = {'Cart': cart};

      await userDocRef.update(updatedData);

      return Right(Cart(productId: productId, quantity: quantity, color: color, size: size));
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }
}
