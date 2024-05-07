import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  User? user = FirebaseAuth.instance.currentUser;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationMail();

      timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  Future sendVerificationMail() async {
    try {
      await user!.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const NavigationMenu()
      : SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 500,
                      child: Lottie.asset('assets/email_verification.json'),
                    ),
                  ),
                  const Text(
                    'Verify your email address',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${user!.email}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '''
                    Congratulations! Your Account Awaits Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.''',
                    textAlign: TextAlign.center,
                  ),
                  kHeight,
                  kHeight,
                  Button(onTap: () {}),
                  TextButton(onPressed: () {
                    resendVerificationEmail();
                  }, child: const Text('Resend email'))
                ],
              ),
            ),
          ),
        );

        void resendVerificationEmail() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
    ScaffoldMessenger(child: SnackBar(content: Text("we've sent you a verification mail")));
  } catch (e) {
    print('Failed to send verification email: $e');
  }
}
}

class Button extends StatelessWidget {
  final VoidCallback onTap;
  const Button({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 2.0)
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        width: double.infinity,
        child: const Center(
          child: Text(
            'Continue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
