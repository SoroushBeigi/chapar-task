import 'package:chapar_task/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ListApiProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: Constants.baseURL));

  Future<dynamic> loadList(String token) async {
    final response = await _dio.post(
      Constants.listEndpoint,
      options: Options(headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      }),
    );
    return response.data;
  }
}
