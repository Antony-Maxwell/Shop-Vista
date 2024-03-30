import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    this.color,
    this.labelColor,
  });

  final String label;
  final bool selected;
  final void Function(bool)? onSelected;
  final Color? color;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: ChoiceChip(
        color: MaterialStatePropertyAll(color),
        selectedColor: Colors.grey,
        // backgroundColor: color,
        label: Text(label),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: labelColor),
      ),
    );
  }
}
