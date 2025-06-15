import 'package:fiboecommerce/features/Home/data/models/productModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_products_model.g.dart';
@JsonSerializable()
class ResponseProductsModel {
  List<ProductModel> products;
  int total;
  int skip;
  int limit;
  ResponseProductsModel(
  this.products, this.total, this.skip,
  this.limit);

  factory ResponseProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseProductsModelToJson(this);

}