import 'package:chapar_task/core/utils/theme.dart';
import 'package:flutter/material.dart';

//This is just an example, only error and normal snackbars are used in this task
enum SnackbarType { success, error, warning, info }

customSnackBar({SnackbarType? type,required String text}){
  Color snackBarColor;
    if (type == SnackbarType.success) {
      snackBarColor = Colors.green[500]!;
    } else if (type == SnackbarType.warning) {
      snackBarColor = Colors.yellow[300]!;
    } else if (type == SnackbarType.error) {
      snackBarColor = Colors.red[400]!;
    } else {
      snackBarColor = Colors.blueGrey;
    }
  return SnackBar(content: Text(text,textDirection: TextDirection.rtl,style: AppTheme.lightTheme.textTheme.displaySmall,),backgroundColor: snackBarColor,duration: const Duration(milliseconds: 1500),);
}