import 'package:dio/dio.dart';

abstract class ApiService {
  Future<dynamic> post(String Url, Map<String, dynamic> body,{ Options? options});
  Future<dynamic> get(String url);
  Future<dynamic> put(String url, Map<String, dynamic> body);
}
