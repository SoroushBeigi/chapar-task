import 'package:chapar_task/core/utils/constants.dart';
import 'package:dio/dio.dart';

class LoginApiProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: Constants.baseURL, headers: {
    'content-type': 'application/json',
    'accept': 'application/json',
  }));

  Future<dynamic> login(String email, String password) async {
    final response = await _dio.post(
      Constants.loginEndpoint,
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }
}
