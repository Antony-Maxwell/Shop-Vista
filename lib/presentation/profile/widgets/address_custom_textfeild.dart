
import 'package:flutter/material.dart';

class CustomAddressTextFeild extends StatelessWidget {
  const CustomAddressTextFeild({
    super.key,
    required this.nameController,
    required this.icon,
    required this.hint, required this.errMsg, required this.isNumber,
  });

  final TextEditingController nameController;
  final IconData icon;
  final String hint;
  final String errMsg;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return
    isNumber
    ?
    TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        
        prefixIcon: Icon(icon),
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        )
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if(value == null || value.isEmpty){
          return errMsg;
        }
        return null;
      },
    )
    :
    TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        
        prefixIcon: Icon(icon),
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        )
      ),
      validator: (value) {
        if(value == null || value.isEmpty){
          return errMsg;
        }
        return null;
      },
    );
  }
}