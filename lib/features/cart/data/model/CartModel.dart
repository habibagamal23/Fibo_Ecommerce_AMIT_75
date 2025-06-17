import 'package:json_annotation/json_annotation.dart';

import 'CartproductModel.dart';
part 'CartModel.g.dart';
@JsonSerializable()
class  CartModel{
  int id ;
  List<CartproductModel> products;
  double total ;
  double discountedTotal;
  int totalProducts;
  CartModel({required this.id,required this.products,required this.total,required this.discountedTotal,required this.totalProducts});
factory CartModel.fromJson(Map<String,dynamic> json)=>_$CartModelFromJson(json);
Map<String,dynamic> toJson()=>_$CartModelToJson(this);
}