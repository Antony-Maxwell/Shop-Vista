import 'package:flutter/material.dart';

class GetColor {
  Color getColorFromName(String colorName) {
    // Convert color name to hexadecimal color code
    switch (colorName.toLowerCase()) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'white':
        return Colors.grey;
      case 'black':
        return Colors.black;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'teal':
        return Colors.teal;
      case 'cyan':
        return Colors.cyan;
      case 'amber':
        return Colors.amber;
      // Add more color cases as needed
      default:
        return Colors.black; // Default color
    }
  }
}
