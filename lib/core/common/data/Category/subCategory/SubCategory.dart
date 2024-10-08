// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';



part 'SubCategory.g.dart';

@JsonSerializable()
class SubCategory{

  num? id;
  String? name;
  String? parentId;
  String? image;
  String? icon;
  String? slug;
  String? status;


  SubCategory(this.id, this.name, this.parentId, this.image, this.icon,
      this.slug, this.status);

  factory SubCategory.fromJson(Map<String,dynamic>json)=>
      _$SubCategoryFromJson(json);
  Map<String,dynamic>toJson()=>_$SubCategoryToJson(this);
}