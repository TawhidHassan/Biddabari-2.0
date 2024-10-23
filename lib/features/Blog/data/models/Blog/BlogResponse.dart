// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/Category/Categorie.dart';
import 'BlogData.dart';




part 'BlogResponse.g.dart';

@JsonSerializable()
class BlogResponse{


  List<Categorie>? blogCategories;
  BlogData? blogs;


  BlogResponse(this.blogCategories, this.blogs);

  factory BlogResponse.fromJson(Map<String,dynamic>json)=>
      _$BlogResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$BlogResponseToJson(this);
}