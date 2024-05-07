import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/get_wishlist/getwishlist_bloc.dart';
import 'package:shop_vista/domain/core/main_failures.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';

class AddToWishlist{
  Future<Either<MainFailure, bool>> setWishlist(String userId, String productId, BuildContext context)async{
    try{
      CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');
      DocumentReference userDocRef = userCollection.doc(userId);

      DocumentSnapshot userDocSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userDocSnapshot.data() as Map<String, dynamic>?;
      List<String>? wishlist = List<String>.from(userData?['Wishlist'] ?? []);
      if (wishlist.contains(productId)) {
        wishlist.remove(productId);
        CustomSnackBar().showErrorSnackBar(context, 'Product removed successfully');
         BlocProvider.of<GetwishlistBloc>(context).add(GetwishlistEvent.getWishlist(userId));
      } else {
        wishlist.add(productId);
        CustomSnackBar().showSuccessSnackBar(context,'Product added successfully');
      }
      Map<String, dynamic> updatedData = {'Wishlist': wishlist};
      await userDocRef.update(updatedData);
      print('success');
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
    }
  }