import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/infrastructure/emailandpass_auth_impl/firebase_auth_service.dart';
import 'package:shop_vista/infrastructure/facebook_auth_impl/facebook_auth_service.dart';
import 'package:shop_vista/infrastructure/google_impl/google_auth_service.dart';
import 'package:shop_vista/presentation/auth/sign_up.dart';
import 'package:shop_vista/presentation/auth/widgets/login_text_field.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Spacer(),
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
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("assets/shopVista.png"),
                  ),
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Discover Limitless Choice and Unmatched Convinience',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key,
                  child: Column(
                    children: [
                      logTextFeild(
                          errrMsg: 'Enter your email',
                          emailController: _emailController,
                          hint: 'E-Mail',
                          icon: const Icon(Icons.email_outlined)),
                      const SizedBox(
                        height: 10,
                      ),
                      logTextFeild(
                        errrMsg: 'Enter your password',
                        emailController: _passwordController,
                        hint: 'Password',
                        icon: const Icon(Icons.password_sharp),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Sign(
                        onTap: () {
                          if(_key.currentState!.validate()){
                            _auth.signInWithEmailandPassword(
                              _emailController.text,
                              _passwordController.text,
                              context);
                          }
                        },
                        color: Colors.blue,
                        title: 'Sign In',
                        fontColor: Colors.white,
                        isSignUp: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Sign(
                        fontColor: Colors.black,
                        title: 'Create Account',
                        color: const Color.fromARGB(255, 224, 224, 224),
                        isSignUp: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Divider(),
                      const Text('Or Sign In with '),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 90,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                // Show the loading indicator dialog
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        child: Text(
                                          'Signing in...',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  },
                                );
                                final userCredential =
                                    await AuthService().signInWithGoogle();
                                Navigator.pop(context);
                                if (userCredential != null) {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return NavigationMenu();
                                    },
                                  ), (route) => false);
                                } else {}
                              },
                              child: Container(
                                child:
                                    Image.asset("assets/icons8-google-48.png"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                // Show the loading indicator dialog
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        child: Text(
                                          'Signing in...',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // You can customize the loading indicator here
                                      // For example, using CircularProgressIndicator
                                      // icon: CircularProgressIndicator(),
                                    );
                                  },
                                );

                                // Call the signInWithGoogle method and await the result
                                final userCredential =
                                    await FaceBookAuthServices()
                                        .signInWithFacebook();

                                // Close the loading indicator dialog
                                Navigator.pop(context);

                                // Check if the sign-in was successful
                                if (userCredential != null) {
                                  // Navigate to the desired screen or perform any other actions
                                } else {
                                  // Handle sign-in failure, if needed
                                }
                              },
                              child: Container(
                                child: Image.asset(
                                    "assets/icons8-facebook-48.png"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}