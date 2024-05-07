import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      print('success 1');

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      print('success 2');

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      print('success 3');
      
      // Sign in with Google credential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      
      // Save empty details to Firebase collection "Users"
      final usersCollection = FirebaseFirestore.instance.collection('Users');
      await usersCollection.doc(userCredential.user?.uid).set({
        'UserId': userCredential.user?.uid,
        'Addresses': [],
        'Cart': [],
        'Email': userCredential.user?.email,
        'FirstName': '',
        'LastName': '',
        'Password': '', // Note: This is not recommended to save passwords in clear text. This is just for demonstration purposes.
        'PhoneNumber': 0,
        'ProfilePicture': '',
        'UserName': '',
        'Wishlist': [],
        'Orders': [],
      });
      
      return userCredential;
    } catch (e) {
      print('Error occurred while signing in with Google: $e');
      return null;
    }
  }
}
