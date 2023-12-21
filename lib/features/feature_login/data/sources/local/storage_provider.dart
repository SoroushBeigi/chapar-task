import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageProvider {
  final storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
    debugPrint('Token written in storage: $token');
  }

    Future<String?> readToken()async{
    String? token = await storage.read(key: 'token');
    debugPrint('Token read from storage: $token');
    return token;
  }
}
