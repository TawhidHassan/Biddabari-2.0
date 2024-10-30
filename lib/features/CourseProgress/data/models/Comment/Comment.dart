// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/user/User.dart';




part 'Comment.g.dart';

@JsonSerializable()
class Comment{

  num? id;
  num? user_id;
  num? parent_model_id;
  String? type;
  String? name;
  String? message;
  String? created_at;
  num? is_seen;
  num? status;
  User? user;


  Comment(this.id, this.user_id, this.parent_model_id, this.type, this.name,
      this.message, this.created_at, this.is_seen, this.status, this.user);

  factory Comment.fromJson(Map<String,dynamic>json)=>
      _$CommentFromJson(json);
  Map<String,dynamic>toJson()=>_$CommentToJson(this);
}