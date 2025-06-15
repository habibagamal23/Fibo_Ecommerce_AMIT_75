
import 'package:json_annotation/json_annotation.dart';
part 'productModel.g.dart';
@JsonSerializable()
class ProductModel{
  int? id;
  String? title;
  String? description;
  String? thumbnail;
  double? price;
  ProductModel({this.id,this.title,this.description,this.thumbnail,this.price});

factory ProductModel.fromJson(Map<String, dynamic> json)=>_$ProductModelFromJson(json);

Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}