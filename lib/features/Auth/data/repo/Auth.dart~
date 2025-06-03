import 'package:dio/dio.dart';
import 'package:fiboecommerce/features/Auth/data/model/UserModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthNetwork {
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        responseHeader: true,
        responseBody: true,
        requestHeader: true,
        error: true,
        requestBody: true));

  Future<UserModel> loginUser(String username, String password) async {
    try {
      final resp = await dio.post("https://dummyjson.com/auth/login", data: {
        'username': username,
        'password': password,
      });
      print(resp.data['id']);
      final user = UserModel.fromJson(resp.data);
      return user;
    } on DioException catch (e) {
      throw Exception("${e.response?.statusCode} ${e.message}");
    }
  }
}
