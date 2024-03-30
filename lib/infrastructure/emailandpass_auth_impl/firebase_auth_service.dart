import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/auth/login.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
