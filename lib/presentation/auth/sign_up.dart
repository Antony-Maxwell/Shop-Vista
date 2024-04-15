import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/infrastructure/emailandpass_auth_impl/firebase_auth_service.dart';
import 'package:shop_vista/infrastructure/facebook_auth_impl/facebook_auth_service.dart';
import 'package:shop_vista/infrastructure/google_impl/google_auth_service.dart';
import 'package:shop_vista/presentation/auth/verify_email.dart';
import 'package:shop_vista/presentation/home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool checkedVal = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _firstnameController.dispose();
    _confirmPassController.dispose();
    _lastnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SignTextFeild(
                            emailController: _firstnameController,
                            icon: Icon(Icons.person),
                            hint: 'First Name')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: SignTextFeild(
                            emailController: _lastnameController,
                            icon: Icon(Icons.person),
                            hint: 'Last Name')),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SignTextFeild(
                    emailController: _usernameController,
                    icon: Icon(Icons.person_2_sharp),
                    hint: 'Username'),
                SizedBox(
                  height: 10,
                ),
                SignTextFeild(
                    emailController: _emailController,
                    icon: Icon(Icons.email_outlined),
                    hint: 'E-Mail'),
                SizedBox(
                  height: 10,
                ),
                SignTextFeild(
                    emailController: _phoneNumberController,
                    icon: Icon(Icons.phone_android_sharp),
                    hint: 'Phone Number'),
                SizedBox(
                  height: 10,
                ),
                SignTextFeild(
                    emailController: _passwordController,
                    icon: Icon(Icons.password),
                    hint: 'Password'),
                SizedBox(
                  height: 10,
                ),
                SignTextFeild(
                    emailController: _confirmPassController,
                    icon: Icon(Icons.password_sharp),
                    hint: 'Confirm Password'),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: checkedVal,
                      onChanged: (value) {
                        setState(() {
                          checkedVal = value!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    const Text(
                      'Agree to Privacy Policy and Terms of use',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  ],
                ),
                sign(onTap: signUp),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                Text('Or Sign Up with '),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => AuthService().signInWithGoogle(),
                        child: Container(
                          child: Image.asset("assets/icons8-google-48.png"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            FaceBookAuthServices().signInWithFacebook(),
                        child: Container(
                          child: Image.asset("assets/icons8-facebook-48.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  // void signUp()async{
  //   String userName = _usernameController.text;
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //   String firstName = _firstnameController.text;
  //   String lastName = _lastnameController.text;
  //   String phoneNumber = _phoneNumberController.text;

  //   User? user = await _auth.signUpWithEmailandPassword(email, password);

  //   if(user != null){
  //     print('User successfully created');
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //       return HomeScreen();
  //     },));
  //   }else{
  //     print('Some error occurs');
  //   }
  // }
  void signUp() async {
    String userName = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String firstName = _firstnameController.text;
    String lastName = _lastnameController.text;
    String phoneNumber = _phoneNumberController.text;

    User? user;
    // Perform email/password sign-up
    user = await _auth.signUpWithEmailandPassword(email, password, context, userName,  firstName, lastName, '', int.parse(phoneNumber));

    // If user is null, email/password sign-up failed
    if (user == null) {
      print('Email/Password Sign-Up failed');
      return;
    }else{
      print('Success');
    }

    // Navigate to HomeScreen after successful sign-up or Google Sign-In
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return VerifyEmailScreen();
    }));
  }
}

class SignTextFeild extends StatelessWidget {
  const SignTextFeild({
    super.key,
    required TextEditingController emailController,
    required this.icon,
    required this.hint,
  }) : controller = emailController;

  final TextEditingController controller;
  final icon;
  final hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        prefixIcon: icon,
      ),
    );
  }
}

class sign extends StatelessWidget {
  final VoidCallback onTap;
  sign({
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
            'Create Account',
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
