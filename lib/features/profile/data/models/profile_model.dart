import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/profile.dart';


part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Profile {

  String? name;
  ProfileModel(this.name,);





  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}