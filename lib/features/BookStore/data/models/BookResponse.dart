// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'book/Book.dart';



part 'BookResponse.g.dart';

@JsonSerializable()
class BookResponse{



  bool? success;
  String? message;
  List<Book>?products;


  BookResponse(this.success, this.message, this.products);

  factory BookResponse.fromJson(Map<String,dynamic>json)=>
      _$BookResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$BookResponseToJson(this);
}