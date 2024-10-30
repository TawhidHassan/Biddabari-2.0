// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Comment.dart';



part 'CommentResponse.g.dart';

@JsonSerializable()
class CommentResponse{



  bool? success;
  String? message;
  List<Comment>?comments;


  CommentResponse(this.success, this.message, this.comments);

  factory CommentResponse.fromJson(Map<String,dynamic>json)=>
      _$CommentResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CommentResponseToJson(this);
}