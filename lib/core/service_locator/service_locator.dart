import 'package:dio/dio.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:fiboecommerce/features/Auth/data/repo/AuthRepoImpl.dart';
import 'package:fiboecommerce/features/Auth/presention/viewModel/login_cubit.dart';
import 'package:fiboecommerce/features/Home/data/repos/HomeRepostiy.dart';
import 'package:fiboecommerce/features/Home/presention/cubit/home_cubit.dart';
import 'package:fiboecommerce/features/cart/data/repo/cartRepo.dart';
import 'package:fiboecommerce/features/cart/presention/cubit/cart_cubit.dart';
import 'package:fiboecommerce/features/payment/data/repo/PaymentRepi.dart';
import 'package:fiboecommerce/features/payment/data/repo/paymentbyStripeimple.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/data/repo/auth_repository.dart';
import '../network/dioService.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // dio  object
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioService(getIt<Dio>()));

// all repo lazysinglton
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepoImpl(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImp(getIt<ApiService>()));
  getIt
      .registerLazySingleton<CartRepo>(() => CartRepoImpl(getIt<ApiService>()));
  getIt
      .registerLazySingleton<PaymentRepo>(() => PaymentbyStripeimple(getIt<ApiService>()));

// alll cubit factory
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));
}
