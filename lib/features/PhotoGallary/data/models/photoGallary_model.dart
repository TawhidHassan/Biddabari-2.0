import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/PhotoGallary.dart';


part 'photoGallary_model.g.dart';

@JsonSerializable()
class PhotoGallaryModel extends PhotoGallary {

  String? name;
  PhotoGallaryModel(this.name,);





  factory PhotoGallaryModel.fromJson(Map<String, dynamic> json) => _$PhotoGallaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoGallaryModelToJson(this);
}