import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';

class RemoveFromWishlist{
  Future<Either<MainFailure, bool>> removeFromWishlist(String userId, String productId, BuildContext context) async {
    try {
      CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');
      DocumentReference userDocRef = userCollection.doc(userId);

      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;
      List<String>? wishlist = List<String>.from(userData?['Wishlist'] ?? []);

      // Check if the product exists in the wishlist
      if (wishlist.contains(productId)) {
        // Remove the product from the wishlist
        wishlist.remove(productId);
        CustomSnackBar().showSuccessSnackBar(context, 'Product removed successfully');
      } else {
        // Product not found in wishlist, show error snackbar
        CustomSnackBar().showErrorSnackBar(context, 'Product not found in wishlist');
        return Right(false);
      }

      // Create a map with updated wishlist data
      Map<String, dynamic> updatedData = {'Wishlist': wishlist};

      // Update only the wishlist field in the document
      await userDocRef.update(updatedData);
      print('success');

      // Return Right indicating success
      return Right(true);
    } catch (e) {
      // Return Left with a MainFailure indicating failure
      return Left(MainFailure.serverFailure());
    }
  }
}