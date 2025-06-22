import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fiboecommerce/core/network/Failers.dart';
import 'package:fiboecommerce/core/network/apiService.dart';

import 'package:fiboecommerce/features/Auth/data/model/UserModel.dart';

import 'auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failures, UserModel>> loginUserbyApi(
      String username, String password)async {
    try {
      final data = await apiService.post("https://dummyjson.com/auth/login", {
        'username': username,
        'password': password,
      } );
      final user = UserModel.fromJson(data as Map<String, dynamic>);
      return Future.value(Right(user));
    } catch (e) {
      if (e is DioException) {
        return Future.value(Left(ServerFailure.fromDioExption(e)));
      }
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }
}
