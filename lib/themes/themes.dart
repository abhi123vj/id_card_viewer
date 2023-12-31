import 'package:flutter/material.dart';
import 'package:id_card_maker/constants/app_colors.dart';

class Themes {
  static final light = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.amber.withOpacity(0),elevation: 0),
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );

  static final dark = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.amber.withOpacity(0),elevation: 0),
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    scaffoldBackgroundColor: Colors.black45,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );
}
