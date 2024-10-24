// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import 'Gallary.dart';
part 'GallaryResponse.g.dart';

@JsonSerializable()
class GallaryResponse{




  List<Gallary>? galleries;


  GallaryResponse(this.galleries);

  factory GallaryResponse.fromJson(Map<String,dynamic>json)=>
      _$GallaryResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$GallaryResponseToJson(this);
}