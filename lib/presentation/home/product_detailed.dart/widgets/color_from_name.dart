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
      // Add more color cases as needed
      default:
        return Colors.black; // Default color
    }
  }
}
