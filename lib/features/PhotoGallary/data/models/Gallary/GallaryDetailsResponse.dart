// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'Gallary.dart';
part 'GallaryDetailsResponse.g.dart';

@JsonSerializable()
class GallaryDetailsResponse{




  Gallary? gallery;


  GallaryDetailsResponse(this.gallery);

  factory GallaryDetailsResponse.fromJson(Map<String,dynamic>json)=>
      _$GallaryDetailsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$GallaryDetailsResponseToJson(this);
}