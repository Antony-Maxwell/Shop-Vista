
import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/auth/sign_up.dart';

class Sign extends StatelessWidget {
  final VoidCallback? onTap;
  const Sign({
    this.onTap,
    required this.title,
    required this.color,
    required this.fontColor,
    required this.isSignUp,
    super.key,
  });

  final String title;
  final Color color;
  final Color fontColor;
  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSignUp
          ? () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ));
            }
          : onTap,
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
          color: color,
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
