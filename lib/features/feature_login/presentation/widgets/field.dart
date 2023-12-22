import 'package:chapar_task/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData prefixIconData;
  final bool isObscure;
  const Field(
      {required this.controller,
      required this.hint,
      required this.prefixIconData,
      required this.isObscure,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: TextField(
        style: TextStyle(fontSize: 19.sp),
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.red,
          prefixIcon: Icon(prefixIconData),
          hintText: hint,
          hintStyle: AppTheme.hintStyle,
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
