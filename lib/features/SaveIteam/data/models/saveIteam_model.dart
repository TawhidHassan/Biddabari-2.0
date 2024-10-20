import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/SaveIteam.dart';


part 'saveIteam_model.g.dart';

@JsonSerializable()
class SaveIteamModel extends SaveIteam {

  String? name;
  SaveIteamModel(this.name,);





  factory SaveIteamModel.fromJson(Map<String, dynamic> json) => _$SaveIteamModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveIteamModelToJson(this);
}