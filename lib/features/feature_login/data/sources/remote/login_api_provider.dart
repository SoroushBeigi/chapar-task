import 'package:chapar_task/core/utils/constants.dart';
import 'package:dio/dio.dart';

class LoginApiProvider {
  final Dio _dio = Dio(BaseOptions(headers: {
    'content-type': 'application/json',
    'accept': 'application/json',
  }));
  //TODO: add baseUrl

  Future<dynamic> login(String email, String password) async {
    final response = await _dio.post(
      Constants.baseURL + Constants.loginEndpoint,
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }
}
