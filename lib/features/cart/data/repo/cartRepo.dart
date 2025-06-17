import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fiboecommerce/core/network/Failers.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:fiboecommerce/features/cart/data/model/CartModel.dart';

abstract class CartRepo {
  Future<Either<Failures, CartModel>> getCart();
  Future<Either<Failures, CartModel>> AddProduct(int id, int quantity);
}

class CartRepoImpl implements CartRepo {
  ApiService apiService;
  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failures, CartModel>> getCart() async {
    try {
      final data = await apiService.get("https://dummyjson.com/carts/1");
      return Future.value(Right(CartModel.fromJson(data)));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(e.message.toString()));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> AddProduct(int id, int quantity) async {
    try {
      final data = await apiService.put("https://dummyjson.com/carts/1", {
        "merge": true,
        "products": [
          {"id": id, "quantity": quantity}
        ]
      });
      return Future.value(Right(CartModel.fromJson(data)));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
