import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Newtork {
  getUser() async {
    Dio dio = Dio()..interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        error: true,
        responseBody: true,
        responseHeader: true
      )
    );
    try {
      final resp = await dio.get('https://dummyjson.com/users');
      print(resp.data);
    } on DioException catch (e) {
      throw Exception(
          "the satuse code is ${e.response?.statusCode} the error mss ${e.message} ");
    }
  }
}
