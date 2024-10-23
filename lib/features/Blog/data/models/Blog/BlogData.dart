// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Blog.dart';



part 'BlogData.g.dart';

@JsonSerializable()
class BlogData{

  int? current_page;
  List<Blog>?data;
  String?first_page_url;
  String?last_page_url;


  BlogData(
      this.current_page, this.data, this.first_page_url, this.last_page_url);

  factory BlogData.fromJson(Map<String,dynamic>json)=>
      _$BlogDataFromJson(json);
  Map<String,dynamic>toJson()=>_$BlogDataToJson(this);
}