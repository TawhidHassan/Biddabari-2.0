// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'book/MyBook.dart';



part 'MyBookResponse.g.dart';

@JsonSerializable()
class MyBookResponse{


  List<MyBook>? products;
  num? deliveryCharge;


  MyBookResponse(this.products, this.deliveryCharge);

  factory MyBookResponse.fromJson(Map<String,dynamic>json)=>
      _$MyBookResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$MyBookResponseToJson(this);
}