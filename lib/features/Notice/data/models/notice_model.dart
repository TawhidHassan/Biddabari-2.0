import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Notice.dart';


part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel extends Notice {

  String? name;
  NoticeModel(this.name,);





  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);
}