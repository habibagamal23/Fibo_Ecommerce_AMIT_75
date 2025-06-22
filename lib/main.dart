import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:fiboecommerce/core/network/dioService.dart';
import 'package:fiboecommerce/features/Auth/data/repo/AuthRepoImpl.dart';
import 'package:fiboecommerce/features/cart/presention/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'core/routing/router_generation_config.dart';
import 'core/service_locator/service_locator.dart';
import 'core/storage/storage_helper.dart';
import 'core/styling/theme_data.dart';
import 'features/Auth/data/repo/auth_repository.dart';
import 'features/Auth/presention/viewModel/login_cubit.dart';
import 'features/Home/data/repos/HomeRepostiy.dart';
import 'features/Home/presention/cubit/home_cubit.dart';
import 'generated/codegen_loader.g.dart';
import 'generated/locale_keys.g.dart';
import 'network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   Stripe.publishableKey = "";
  setupServiceLocator();
  runApp(EasyLocalization(
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => getIt<CartCubit>()),
      ],
      child: const MyApp(),
    ),
    supportedLocales: [Locale('en'), Locale('ar')],
    path: "assets/translations",
    fallbackLocale: Locale('en'),
    assetLoader: CodegenLoader(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp.router(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            title: 'Fibo Ecommerce',
            theme: AppThemes.lightTheme,
            routerConfig: RouterGeneration.goRouter,
          );
        });
  }
}

class Sec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale.languageCode == "en") {
                  context.setLocale(Locale("ar"));
                } else {
                  context.setLocale(Locale("en"));
                }
              },
              icon: Icon(Icons.language)),
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Text(LocaleKeys.Auth_login.tr()),
      ),
    );
  }
}
