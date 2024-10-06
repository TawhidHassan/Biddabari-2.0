import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/ClassRoom.dart';


part 'classRoom_model.g.dart';

@JsonSerializable()
class ClassRoomModel extends ClassRoom {

  String? name;
  ClassRoomModel(this.name,);





  factory ClassRoomModel.fromJson(Map<String, dynamic> json) => _$ClassRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomModelToJson(this);
}