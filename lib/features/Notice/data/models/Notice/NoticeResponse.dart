// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Notice.dart';



part 'NoticeResponse.g.dart';

@JsonSerializable()
class NoticeResponse{



  bool? success;
  String? message;
  List<Notice>?notices;
  Notice?popupNotification;


  NoticeResponse(this.success, this.message, this.notices,this.popupNotification);

  factory NoticeResponse.fromJson(Map<String,dynamic>json)=>
      _$NoticeResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$NoticeResponseToJson(this);
}