import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Lottie.network("https://lottie.host/cc7df85f-c9e6-4298-921b-367a01e4f231/17Ual57Pqj.json", repeat: true, ),
              ),
              const Text('Your payment was done successfully'),
              kHeight,
              Sign(title: 'Ok', color: Colors.blue, fontColor: Colors.white, isSignUp: false, onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NavigationMenu(),), (route) => false),),
            ],
          ),
        ),
      ),
    );
  }
}