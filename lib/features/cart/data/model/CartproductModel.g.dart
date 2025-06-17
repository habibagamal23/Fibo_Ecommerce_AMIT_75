// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartproductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartproductModel _$CartproductModelFromJson(Map<String, dynamic> json) =>
    CartproductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$CartproductModelToJson(CartproductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'thumbnail': instance.thumbnail,
    };
