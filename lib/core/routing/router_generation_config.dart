import 'package:fiboecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterGeneration{
  static const String splash = "/splash";
  static const String home = "/home";
  static const String login="/login" ;

  static GoRouter goRouter = GoRouter(
    initialLocation: home,
      routes: [
       GoRoute(
           path: splash ,
           builder: (context, state ){
         return Sec();
       } )
        ,
        GoRoute(
            path: home,
            builder: (context, state ){
              return MyHomePage(title: "home");
            } )
        ,
      ],
    debugLogDiagnostics: true ,
    errorPageBuilder: (context, state) => MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    )
  
  );

}