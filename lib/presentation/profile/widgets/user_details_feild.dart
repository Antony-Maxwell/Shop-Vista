
import 'package:flutter/material.dart';

class UserDetailsFeild extends StatelessWidget {
  const UserDetailsFeild({
    super.key,
    required this.hintText,
    required this.value,
    required this.onpressed,
  });

  final String hintText;
  final String value;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          hintText,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(onPressed: onpressed, icon: const Icon(Icons.arrow_forward)),
      ],
    );
  }
}
