// ignore_for_file: file_names
import 'package:biddabari_new/features/Job/data/models/job_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/common/data/Category/Categorie.dart';
part 'JobResponse.g.dart';

@JsonSerializable()
class JobResponse{


  List<Categorie>? circularCategories;
  List<Categorie>? circulars;

  List<JobModel>? recentPosts;
  JobModel? circular;


  JobResponse(this.circularCategories, this.circulars, this.recentPosts, this.circular);

  factory JobResponse.fromJson(Map<String,dynamic>json)=>
      _$JobResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$JobResponseToJson(this);
}