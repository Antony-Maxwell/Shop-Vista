import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google sign in

  signInWithGoogle() async {
    //begin interative sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    print('success 1');

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    print('success 2');

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    print('success 3');

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
