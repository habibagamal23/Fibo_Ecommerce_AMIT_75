import 'package:flutter/foundation.dart';
// by jsonseriblase
class PaymentIntenModel {
  String client_secret;
  PaymentIntenModel({required this.client_secret});
  factory PaymentIntenModel.fromjson(Map<String, dynamic> json) {
    return PaymentIntenModel(client_secret: json['client_secret']);
  }
}
