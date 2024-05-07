import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/infrastructure/user_detail_imp/user_detail_impl.dart';

class OrderHelper{

  Future<void> updateOrder(List<Cart> cartItems, orderId )async{
  Future<void> updateDummyOrderToFirebase(List<Cart> cartItems, orderId ) async {

        List<String> productIds = [];
    for (var cart in cartItems) {
      productIds.add(cart.productId);
    }
  // Create a dummy order data
  Map<String, dynamic> orderData = {
    'Status': 'Pending',
    'ProductIds': productIds,
    'OrderId': orderId,
    'Date': DateTime.now().toIso8601String(),
  };

  // Get current user ID from FirebaseAuth
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  // Update the order data to Firebase
  if (userId != null) {
    try {
      // Get existing user data
      DocumentSnapshot userDocSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(userId).get();

      // Extract existing orders list
      List<dynamic> existingOrders = (userDocSnapshot.data() as Map<String, dynamic>)['Orders'] ?? [];

      // Add the dummy order to the existing list
      existingOrders.add(orderData);

      // Update the Orders field with the updated list
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .update({'Orders': existingOrders});

      print('order data updated successfully');
    } catch (e) {
      print('Failed to update order data: $e');
    }
  } else {
    print('No user is currently logged in');
  }
}
  
  }
}