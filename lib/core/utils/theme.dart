import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme {
  //Dark theme or other different themes can be added too!
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.blue[200],
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 19.sp),
      titleLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp,color: Colors.white)
    ),
  );

  static BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.5),
    borderRadius: const BorderRadius.all(
      Radius.circular(30),
    ),
  );
}
