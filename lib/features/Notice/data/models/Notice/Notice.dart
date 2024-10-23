// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';



part 'Notice.g.dart';

@JsonSerializable()
class Notice{

  num? id;
  num? notice_category_id;
  String? title;
  String? image;
  String? body;
  String? type;
  String? slug;
  int? status;
  String? created_at;
  String? updated_at;


  Notice(this.id, this.notice_category_id, this.title, this.image, this.body,
      this.type, this.slug, this.status, this.created_at, this.updated_at);

  factory Notice.fromJson(Map<String,dynamic>json)=>
      _$NoticeFromJson(json);
  Map<String,dynamic>toJson()=>_$NoticeToJson(this);
}