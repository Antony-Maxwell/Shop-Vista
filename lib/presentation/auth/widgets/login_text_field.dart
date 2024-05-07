
import 'package:flutter/material.dart';

class logTextFeild extends StatelessWidget {
  const logTextFeild({
    super.key,
    required TextEditingController emailController,
    required this.icon,
    required this.hint, required this.errrMsg,
  }) : controller = emailController;

  final TextEditingController controller;
  final icon;
  final hint;
  final String errrMsg;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint,
        prefixIcon: icon,
      ),
      validator: (value) {
        if(value == null || value.isEmpty){
          return errrMsg;
        }else{
          return null;
        }
      },
    );
  }
}
