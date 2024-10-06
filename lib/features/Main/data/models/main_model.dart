import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Main.dart';


part 'main_model.g.dart';

@JsonSerializable()
class MainModel extends Main {

  String? name;
  MainModel(this.name,);





  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}