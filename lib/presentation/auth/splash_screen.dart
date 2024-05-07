import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_vista/presentation/auth/on_boarding_one.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          Future.delayed(const Duration(seconds: 3), () {
            if (snapshot.hasData) {
              User? user = snapshot.data;
              if (user!.emailVerified) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const NavigationMenu()),
                );
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OnBoardingOne()),
                );
              }
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const OnBoardingOne()),
              );
            }
          });

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 7.0,
                          spreadRadius: 5.0,
                        )
                      ],
                    ),
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset("assets/shopVista.png"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ShopVista',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
