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
      height: 7.5.h,
      child: TextField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.red,
          prefixIcon: Icon(prefixIconData),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
