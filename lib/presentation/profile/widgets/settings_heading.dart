
import 'package:flutter/material.dart';

class SettingsHeading extends StatelessWidget {
  const SettingsHeading({
    required this.heading,
    super.key,
  });
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 15),
      child:  Text(
        heading,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
