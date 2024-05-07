import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';

class AddReviewToFirebase{
Future<void> addReviewToFirebase(String productId, String date, String rating, String description, String userId) async {
  try {
    // Create a review object
    Reviews newReview = Reviews(
      date: date,
      rating: rating,
      description: description,
      userId: userId,
    );

    // Get the product document reference
    DocumentReference productRef = FirebaseFirestore.instance.collection('Products').doc(productId);

    // Get the current list of reviews for the product
    DocumentSnapshot productSnapshot = await productRef.get();
    List<dynamic> existingReviews = (productSnapshot.data() as Map<String, dynamic>)['Reviews'] ?? [];

    // Add the new review to the existing list
    existingReviews.add(newReview.toJson());

    // Update the product document with the new list of reviews
    await productRef.update({'Reviews': existingReviews});

    print('Review added successfully');
  } catch (e) {
    print('Failed to add review: $e');
  }
}
}