
import 'package:flutter/material.dart';
import 'package:shop_vista/helpers/helper.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyMedium,),
        const SizedBox(width: 10,),
        Expanded(
          child: SizedBox(
            width: THelperFunctions.screenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: value,
              backgroundColor: Colors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
          ))
      ],
    );
  }
}