import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/NotificationApp.dart';


part 'notificationApp_model.g.dart';

@JsonSerializable()
class NotificationAppModel extends NotificationApp {

  String? name;
  NotificationAppModel(this.name,);





  factory NotificationAppModel.fromJson(Map<String, dynamic> json) => _$NotificationAppModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationAppModelToJson(this);
}