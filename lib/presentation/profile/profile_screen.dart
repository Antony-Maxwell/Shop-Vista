import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/infrastructure/emailandpass_auth_impl/firebase_auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuthServices _auth = FirebaseAuthServices();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Profile',
            ),
            ElevatedButton(
                onPressed: () {
                  _auth.signOut(context);
                },
                child: Text(
                  'Log out',
                ))
          ],
        ),
      ),
    );
  }
}
