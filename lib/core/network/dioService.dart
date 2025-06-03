import 'package:dio/dio.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService implements ApiService {
  final Dio _dio;
  DioService(this._dio) {
    _dio.interceptors.add(PrettyDioLogger(
        responseHeader: true,
        responseBody: true,
        requestHeader: true,
        error: true,
        requestBody: true));
  }

  @override
  Future post(String Url, Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(Url, data: body);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
