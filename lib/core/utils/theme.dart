import 'package:flutter/material.dart';

class AppTheme{
  //Dark theme or other different themes can be added too!
  static ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.blue[300],
  textTheme: const TextTheme(bodyLarge: TextStyle(fontWeight: FontWeight.w400)),
  
);
}
