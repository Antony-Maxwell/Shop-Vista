import 'package:flutter/material.dart';

class StockCheck extends StatelessWidget {
  const StockCheck({
    super.key,
    required this.stock,
  });

  final String stock;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Stock : $stock'),
      ],
    );
  }
}
