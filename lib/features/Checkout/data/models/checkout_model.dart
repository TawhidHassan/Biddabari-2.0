import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Checkout.dart';


part 'checkout_model.g.dart';

@JsonSerializable()
class CheckoutModel extends Checkout {

  String? name;
  CheckoutModel(this.name,);





  factory CheckoutModel.fromJson(Map<String, dynamic> json) => _$CheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutModelToJson(this);
}