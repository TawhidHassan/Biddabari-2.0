import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Login.dart';


part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Login {

  String? name;
  LoginModel(this.name,);





  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}