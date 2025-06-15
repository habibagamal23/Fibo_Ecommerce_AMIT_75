
import 'package:dio/dio.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:fiboecommerce/features/Auth/data/repo/AuthRepoImpl.dart';
import 'package:fiboecommerce/features/Auth/presention/viewModel/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/data/repo/auth_repository.dart';
import '../network/dioService.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // dio  object 
getIt.registerSingleton<Dio>(Dio());
getIt.registerSingleton<ApiService> (DioService(getIt<Dio>()));

getIt.registerSingleton<AuthRepository>(AuthRepoImpl(getIt<ApiService>()));


}