import 'package:json_annotation/json_annotation.dart';

part 'CartproductModel.g.dart';
@JsonSerializable()
class CartproductModel {
  int id ;
  String title;
  double price;
  int quantity;
  String thumbnail;
  CartproductModel({required this.id,required this.title,required this.price,required this.quantity,required this.thumbnail});


  factory CartproductModel.fromJson(Map<String, dynamic> json) => _$CartproductModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartproductModelToJson(this);}
