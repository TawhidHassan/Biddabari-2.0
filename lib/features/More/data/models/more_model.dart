import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/More.dart';


part 'more_model.g.dart';

@JsonSerializable()
class MoreModel extends More {

  String? name;
  MoreModel(this.name,);





  factory MoreModel.fromJson(Map<String, dynamic> json) => _$MoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoreModelToJson(this);
}