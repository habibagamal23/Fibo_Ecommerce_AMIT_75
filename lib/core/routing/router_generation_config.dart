import 'package:fiboecommerce/features/Auth/presention/views/LoginScreen.dart';
import 'package:fiboecommerce/features/Home/data/models/productModel.dart';
import 'package:fiboecommerce/features/Home/presention/views/screens/homeScreen.dart';
import 'package:fiboecommerce/features/cart/presention/views/screen/cartScreen.dart';
import 'package:fiboecommerce/features/maps/presention/MapScreen.dart';
import 'package:fiboecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/Home/presention/views/screens/ProductScreen.dart';

class RouterGeneration {
  static const String splash = "/splash";
  static const String home = "/home";
  static const String login = "/login";
  static const String maps = "/maps";
  static const String productScreenDetailes = "/productScreenDeatails";
  static const String cartScreen = "/cartScreen";
  static GoRouter goRouter = GoRouter(
      initialLocation: home,
      routes: [
        GoRoute(
            path: home,
            builder: (context, state) {
              return HomeScreen();
            }),
        GoRoute(
            path: maps,
            builder: (context, state) {
              return MapScreen();
            }),
        GoRoute(
            path: login,
            builder: (context, state) {
              return Loginscreen();
            }),
        GoRoute(
            path: productScreenDetailes,
            builder: (context, state) {
              ProductModel product = state.extra as ProductModel;
              return ProductScreen(
                product: product,
              );
            }),
        GoRoute(
            path: cartScreen,
            builder: (context, state) {
              return Cartscreen();
            }),
      ],
      debugLogDiagnostics: true,
      errorPageBuilder: (context, state) => MaterialPage(
            child: Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            ),
          ));
}
