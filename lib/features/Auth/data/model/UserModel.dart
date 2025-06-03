
import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String username;
  String email;

  UserModel({required this.id, required this.username, required this.email});


 factory  UserModel.fromJson(Map<String, dynamic> json)=>_$UserModelFromJson(json);
}





























