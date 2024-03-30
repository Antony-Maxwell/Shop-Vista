import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/auth/on_boarding_one.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return OnBoardingOne();
        },
      ));
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
                        spreadRadius: 5.0)
                  ]),
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/shopVista.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('ShopVista',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
