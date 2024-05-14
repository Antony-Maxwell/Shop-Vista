import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/domain/core/snackbar/custom_snackbar.dart';
import 'package:shop_vista/infrastructure/emailandpass_auth_impl/firebase_auth_service.dart';
import 'package:shop_vista/infrastructure/facebook_auth_impl/facebook_auth_service.dart';
import 'package:shop_vista/infrastructure/google_impl/google_auth_service.dart';
import 'package:shop_vista/presentation/auth/verify_email.dart';
import 'package:shop_vista/presentation/widgets/navigation_menu.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkedVal = true;
  bool isLoading = false;

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
    return ModalProgressHUD(
      opacity: 0.5,
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SignTextFeild(
                              errorMsg: "Enter your first name",
                                emailController: _firstnameController,
                                icon: const Icon(Icons.person),
                                hint: 'First Name')),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: SignTextFeild(
                                errorMsg: 'Enter your last name',
                                emailController: _lastnameController,
                                icon: const Icon(Icons.person),
                                hint: 'Last Name')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignTextFeild(
                      errorMsg: "Enter your desired username",
                        emailController: _usernameController,
                        icon: const Icon(Icons.person_2_sharp),
                        hint: 'Username'),
                    const SizedBox(
                      height: 10,
                    ),
                    SignTextFeild(
                      errorMsg: "Email can't be empty",
                        emailController: _emailController,
                        icon: const Icon(Icons.email_outlined),
                        hint: 'E-Mail'),
                    const SizedBox(
                      height: 10,
                    ),
                    SignTextFeild(
                      errorMsg: "Enter your phone number",
                        emailController: _phoneNumberController,
                        icon: const Icon(Icons.phone_android_sharp),
                        hint: 'Phone Number'),
                    const SizedBox(
                      height: 10,
                    ),
                    SignTextFeild(
                      errorMsg: "Enter your password",
                        emailController: _passwordController,
                        icon: const Icon(Icons.password),
                        hint: 'Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    SignTextFeild(
                      errorMsg: "Again confirm your password",
                        emailController: _confirmPassController,
                        icon: const Icon(Icons.password_sharp),
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
                        Link(
                          target: LinkTarget.self,
                          builder: (context, followLink) {
                            return TextButton(
                            onPressed: followLink,
                            child: const Text(
                              'Agree to Privacy Policy and Terms of use',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          );
                          },
                          uri: Uri.parse('https://sites.google.com/view/shopvista-privacy-policy/home'),
                        )
                      ],
                    ),
                    sign(onTap: () {
                      if(_formKey.currentState!.validate() && _passwordController.text == _confirmPassController.text){
                        signUp();
                      }else{
                        CustomSnackBar().showErrorSnackBar(context, "Passwords can't be different");
                      }
                    },),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    const Text('Or Sign Up with '),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => AuthService().signInWithGoogle().then((userCredentials) {
                              if(userCredentials != null){
                                print('successfully logged in using google');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationMenu(),));
                              }else{
                                print('error while registering user using google');
                              }
                            } ).catchError((error){
                              print('Error form firebase $error');
                            }),
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
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  void signUp() async {

    setState(() {
      isLoading = true;
    });

    String userName = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String firstName = _firstnameController.text;
    String lastName = _lastnameController.text;
    String phoneNumber = _phoneNumberController.text;

    User? user;
    // Perform email/password sign-up
    user = await _auth.signUpWithEmailandPassword(email, password, context, userName,  firstName, lastName, '', int.parse(phoneNumber));


    setState(() {
      isLoading = false;
    });

    // If user is null, email/password sign-up failed
    if (user == null) {
      print('Email/Password Sign-Up failed');
      return;
    }else{
      print('Success');
    }

    // Navigate to HomeScreen after successful sign-up or Google Sign-In
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const VerifyEmailScreen();
    }));
  }
}

class SignTextFeild extends StatelessWidget {
  const SignTextFeild({
    super.key,
    required TextEditingController emailController,
    required this.icon,
    required this.hint, required this.errorMsg,
  }) : controller = emailController;

  final TextEditingController controller;
  final icon;
  final hint;
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value == null || value.isEmpty){
          return errorMsg;
        }else{
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
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
  const sign({
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
