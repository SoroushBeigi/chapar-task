import 'package:chapar_task/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ListApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> loadList(String token) async {
    final response = await _dio.get(
       Constants.baseURL + Constants.listEndpoint,
      options: Options(headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      }),
    );
    return response.data;
  }
}
