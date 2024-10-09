// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';


import 'book/Book.dart';



part 'SingleBookResponse.g.dart';

@JsonSerializable()
class SingleBookResponse{



  bool? success;
  String? message;
  Book?product;
  List<Book>?latestProducts;


  SingleBookResponse(this.success, this.message, this.product, this.latestProducts);

  factory SingleBookResponse.fromJson(Map<String,dynamic>json)=>
      _$SingleBookResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$SingleBookResponseToJson(this);
}