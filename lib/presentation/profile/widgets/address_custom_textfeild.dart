
import 'package:flutter/material.dart';

class CustomAddressTextFeild extends StatelessWidget {
  const CustomAddressTextFeild({
    super.key,
    required this.nameController,
    required this.icon,
    required this.hint,
  });

  final TextEditingController nameController;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        )
      ),
    );
  }
}