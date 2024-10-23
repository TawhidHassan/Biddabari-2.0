// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Blog.dart';
import 'BlogData.dart';




part 'BlogDetailsResponse.g.dart';

@JsonSerializable()
class BlogDetailsResponse{


  List<Blog>? recentBlogs;
  Blog? blog;


  BlogDetailsResponse(this.recentBlogs, this.blog);

  factory BlogDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$BlogDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$BlogDetailsResponseToJson(this);
}