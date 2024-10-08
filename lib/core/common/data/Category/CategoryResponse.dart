// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Categorie.dart';


part 'CategoryResponse.g.dart';

@JsonSerializable()
class CategoryResponse{



  bool? success;
  String? message;
  List<Categorie>?courseCategories;


  CategoryResponse(this.success, this.message, this.courseCategories);

  factory CategoryResponse.fromJson(Map<String,dynamic>json)=>
      _$CategoryResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CategoryResponseToJson(this);
}