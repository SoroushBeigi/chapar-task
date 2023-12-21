import 'package:chapar_task/app.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const App());
}
