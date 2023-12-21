import 'package:chapar_task/app.dart';
import 'package:chapar_task/features/feature_login/data/sources/local/storage_provider.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';

Future<bool> isLoggedIn() async {
  StorageProvider storageProvider = locator();
  String? token = await storageProvider.readToken();
  if (token != null && token.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  bool loggedIn = await isLoggedIn();
  runApp(App(loggedIn: loggedIn,));
}
