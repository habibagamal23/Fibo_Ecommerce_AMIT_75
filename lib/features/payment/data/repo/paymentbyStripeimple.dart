import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:fiboecommerce/features/payment/data/repo/PaymentRepi.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/network/Failers.dart';
import '../model/paymentIntintModel.dart';

class PaymentbyStripeimple implements PaymentRepo {
  ApiService apiService;
  PaymentbyStripeimple(this.apiService);

  @override
  Future makePayemnt(int amount, String currency) async {
    final reslt = await _creatPaymetendpoint(amount, currency);
    reslt.fold(
        (l) => null, (r) async => await _intitPaymentsheet(r.client_secret));
    await Stripe.instance.presentPaymentSheet();
  }

  Future<Either<Failures, PaymentIntenModel>> _creatPaymetendpoint(
      int amount, String currency) async {
    try {
      final data = await apiService.post(
          "https://api.stripe.com/v1/payment_intents",
          {"amount": amount, "currency": "usd"},
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            // 'Authorization':
            //     'Bearer sk_test_51QLO18KCYYcZnriZy6tOCTMspmHTC38AV7zMSfFD73CdQACvjgwNmwIDkFi8SI7D8xDrSfAMmaJlRTwv9PqqIOTI00iZvgjjVX'
          }));

      return Future.value(Right(PaymentIntenModel.fromjson(data)));
    } catch (e) {
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }

  Future<void> _intitPaymentsheet(String clintScreet) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clintScreet,
            merchantDisplayName: "Fibo"));
  }

  // 1- inti end point secret key
// 2- show paymentsheet
// 2- make payemt
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fiboecommerce/core/network/apiService.dart';
import 'package:fiboecommerce/features/payment/data/repo/PaymentRepi.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/network/Failers.dart';
import '../model/paymentIntintModel.dart';

class PaymentbyStripeimple implements PaymentRepo {
  ApiService apiService;
  PaymentbyStripeimple(this.apiService);

  @override
  Future makePayemnt(int amount, String currency) async {
    final reslt = await _creatPaymetendpoint(amount, currency);
    reslt.fold(
        (l) => null, (r) async => await _intitPaymentsheet(r.client_secret));
    await Stripe.instance.presentPaymentSheet();
  }

  Future<Either<Failures, PaymentIntenModel>> _creatPaymetendpoint(
      int amount, String currency) async {
    try {
      final data = await apiService.post(
          "https://api.stripe.com/v1/payment_intents",
          {"amount": amount, "currency": "usd"},
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            // 'Authorization':
            //     'Bearer sk_test_51QLO18KCYYcZnriZy6tOCTMspmHTC38AV7zMSfFD73CdQACvjgwNmwIDkFi8SI7D8xDrSfAMmaJlRTwv9PqqIOTI00iZvgjjVX'
          }));

      return Future.value(Right(PaymentIntenModel.fromjson(data)));
    } catch (e) {
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }

  Future<void> _intitPaymentsheet(String clintScreet) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clintScreet,
            merchantDisplayName: "Fibo"));
  }

  // 1- inti end point secret key
// 2- show paymentsheet
// 2- make payemt
}
