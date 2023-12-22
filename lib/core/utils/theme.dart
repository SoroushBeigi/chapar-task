import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme {
  //Dark theme or other different themes can be added too!
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.blue[200],
    textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 19.sp,
          fontFamily: 'Vazir',
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17.sp,
          fontFamily: 'Vazir',
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.5.sp,
          fontFamily: 'Vazir',
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          fontFamily: 'Vazir',
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          color: Colors.white,
          fontFamily: 'Vazir',
        ),
        headlineMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'Vazir',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600)),
  );

  static BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.5),
    borderRadius: const BorderRadius.all(
      Radius.circular(30),
    ),
  );

  static PinTheme pinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: Colors.blue),
    ),
  );

  static TextStyle hintStyle = TextStyle(
      color: Colors.grey,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Vazir');
}
