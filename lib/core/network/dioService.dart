import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// object
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
  Future post(String Url, Map<String, dynamic> body, {Options? options}) async {
    try {
      final response = await _dio.post(Url, data: body, options: options);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(String url, Map<String, dynamic> body) async {
    try {
      final response = await _dio.put(url, data: body);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
