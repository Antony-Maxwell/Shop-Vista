import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FaceBookAuthServices {
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result =
          await FacebookAuth.instance.login(permissions: ["email"]);

      // Check if the user canceled the login
      if (result.status == LoginStatus.cancelled) {
        print("Facebook login cancelled by user");
        return null;
      }

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredentials =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Return the user credentials
      return await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredentials);
    } catch (e) {
      print("Error signing in with Facebook: $e");
      return null;
    }
  }
}
