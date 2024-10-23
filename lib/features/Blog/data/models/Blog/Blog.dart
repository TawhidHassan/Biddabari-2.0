// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/Category/Categorie.dart';



part 'Blog.g.dart';

@JsonSerializable()
class Blog{

  num? id;
  num? blog_category_id;
  num? author_id;
  num? is_featured;
  num? hit_count;
  num? status;
  String? title;
  String? sub_title;
  String? video_url;
  String? image;
  String? body;
  String? slug;
  String? updated_at;
  String? created_at;
  Categorie? blog_category;


  Blog(
      this.id,
      this.blog_category_id,
      this.author_id,
      this.is_featured,
      this.hit_count,
      this.status,
      this.title,
      this.sub_title,
      this.video_url,
      this.image,
      this.body,
      this.slug,
      this.updated_at,
      this.created_at,
      this.blog_category);

  factory Blog.fromJson(Map<String,dynamic>json)=>
      _$BlogFromJson(json);
  Map<String,dynamic>toJson()=>_$BlogToJson(this);
}