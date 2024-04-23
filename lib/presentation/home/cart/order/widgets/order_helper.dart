import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/user_detail_impl.dart';

class OrderHelper{

  Future<void> updateOrder(List<Cart> cartItems, orderId )async{
    List<String> productIds = [];
    for (var cart in cartItems) {
      productIds.add(cart.productId);
    }

    Orders orders = Orders(orderId: orderId, productIds: productIds, date: DateTime.now().toString(), status: 'Pending');
     try {
      // Get current user from FirebaseAuth
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Update profilePicture field in Firestore
    Map<String, dynamic> ordersJson = orders.toJson();

      await FirebaseFirestore.instance.collection('Users').doc(user.uid).update({'Orders': ordersJson});

      print('Profile picture updated successfully');
      await Future.delayed(const Duration(seconds: 1));
    // Fetch user details
    final userDetails = await UserDetailsImplementation().getUserDetails();
    userDetails.fold(
      (failure) {
        print('Failed to fetch user details: $failure');
      },
      (userModel) {
        print('User details fetched successfully: $userModel');
      },
    );
    } catch (e) {
      print('Failed to update profile picture: $e');
    }
print('///////////////////////////////////////////>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
  }
  
}