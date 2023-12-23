import 'package:chapar_task/app.dart';
import 'package:chapar_task/core/services/storage_service.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';


//If the users have already logged in, we will skip the login page and go to the list screen 
Future<bool> isLoggedIn() async {
  StorageService storageProvider = locator();
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
