import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fiboecommerce/core/network/Failers.dart';
import 'package:fiboecommerce/core/network/apiService.dart';

import '../models/response_products_model.dart';

abstract class HomeRepo {
  Future<Either<Failures,ResponseProductsModel>> getAllProducts();
}

class HomeRepoImp implements HomeRepo {
  ApiService apiService;
  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failures, ResponseProductsModel>>getAllProducts() async {
    try {
      final data = await apiService.get("https://dummyjson.com/products");
      final dataresp = ResponseProductsModel.fromJson(data);
      return Future.value(Right(dataresp));
    } catch (e) {
      if (e is DioException) {
        return Future.value(Left(ServerFailure.fromDioExption(e)));
      }
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }
}