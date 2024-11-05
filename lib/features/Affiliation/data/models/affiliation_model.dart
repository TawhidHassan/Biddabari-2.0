import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Affiliation.dart';


part 'affiliation_model.g.dart';

@JsonSerializable()
class AffiliationModel extends Affiliation {

  String? name;
  AffiliationModel(this.name,);





  factory AffiliationModel.fromJson(Map<String, dynamic> json) => _$AffiliationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AffiliationModelToJson(this);
}