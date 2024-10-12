// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'CourseOrder.dart';




part 'CourseOrderResponse.g.dart';

@JsonSerializable()
class CourseOrderResponse{

  List<CourseOrder>?courseOrders;


  CourseOrderResponse(this.courseOrders);

  factory CourseOrderResponse.fromJson(Map<String,dynamic>json)=>
      _$CourseOrderResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CourseOrderResponseToJson(this);
}