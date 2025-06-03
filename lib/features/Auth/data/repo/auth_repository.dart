import 'package:dartz/dartz.dart';
import 'package:fiboecommerce/core/network/Failers.dart';

import '../model/UserModel.dart';

//
abstract class AuthRepository {
  Future<Either<Failures , UserModel>> loginUserbyApi(String username, String password);
}