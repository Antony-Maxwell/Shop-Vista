import 'package:flutter/material.dart';
import 'package:shop_vista/utils/theme/custom_themes/appbar_themes.dart';
import 'package:shop_vista/utils/theme/custom_themes/check_box_theme.dart';
import 'package:shop_vista/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:shop_vista/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme);
}
