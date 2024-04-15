import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/presentation/auth/login.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class FirebaseAuthServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(
      String email, String password, BuildContext context, String username, String firstName, String lastName, String profilePic, int phoneNumber) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

      Address address = Address(
          city: 'fgh',
          country: 'cv',
          name: 'ftgh',
          phoneNumber: 65132,
          postalCode: 'ycv',
          state: 'gh',
          street: 'oiuy',
        );
        List<Cart> cart =[
          Cart(
        productId: 'dummy id', 
        quantity: '1'),
        Cart(productId: 'dummy 23', quantity: '3')
        ];
      UserModel user = UserModel(
        address: address,
        cart: cart,
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        phoneNumber: phoneNumber,
        profilePicture: profilePic,
        userName: username,
        wishlist: []
      );
      print('wooooooooooooooooooooooooooooooooooooooooooooooooooooowwwwwwwwwwwww');
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await usersCollection.doc(credential.user?.uid).set({
        ...user.toJson(),
        'UserId' : credential.user?.uid,
      });
      _showSnackbar(context, 'User registered successfully');
      return credential.user;
    } catch (e) {
      print('Error occurred while registering $e');
      _showSnackbar(context, 'Failed to register user: $e');
    }
    return null;
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<User?> signInWithEmailandPassword(
      String email, String password, context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return NavigationMenu();
          },
        ), (route) => false); // Replace '/home' with your route name
      }
      return credential.user;
    } catch (e) {
      print('Error occure while resgistering $e');
    }
    return null;
  }

  Future<void> signOut(context) async {
    try {
      await _auth.signOut();
      print('User signed out successfully');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ), (route) => false);
    } catch (e) {
      print('error is $e');
    }
  }
}
