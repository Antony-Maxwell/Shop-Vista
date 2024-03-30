import 'package:flutter/material.dart';

class productName extends StatelessWidget {
  const productName({
    super.key,
    required this.productname,
  });
  final String productname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(productname,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
