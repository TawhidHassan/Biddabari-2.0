import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/dwonloads.dart';


part 'dwonloads_model.g.dart';

@JsonSerializable()
class DwonloadsModel extends Dwonloads {

  String? name;
  DwonloadsModel(this.name,);





  factory DwonloadsModel.fromJson(Map<String, dynamic> json) => _$DwonloadsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DwonloadsModelToJson(this);
}