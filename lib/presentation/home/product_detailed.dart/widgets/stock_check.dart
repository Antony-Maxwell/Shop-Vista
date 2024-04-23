import 'package:flutter/material.dart';

class StockCheck extends StatelessWidget {
  const StockCheck({
    super.key,
    required this.stock,
  });

  final int stock;

  @override
  Widget build(BuildContext context) {
    if(stock<=0){
      return const Row(
      children: [
        Text('Stock : Outof stock'),
      ],
    );
    }else{
      return const Row(
      children: [
        Text('Stock : Instock'),
      ],
    );
    }
  }
}
