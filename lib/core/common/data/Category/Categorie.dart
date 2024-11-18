// ignore_for_file: file_names

import 'package:biddabari_new/features/Job/data/models/job_model.dart';
import 'package:json_annotation/json_annotation.dart';





part 'Categorie.g.dart';

@JsonSerializable()
class Categorie{

  num? id;
  String? name;
  String? title;
  String? image;
  String? parentId;
  String? slug;
  List<JobModel>? circulars;


  Categorie(
      {this.id, this.name, this.title, this.image, this.slug, this.circulars});

  factory Categorie.fromJson(Map<String,dynamic>json)=>
      _$CategorieFromJson(json);
  Map<String,dynamic>toJson()=>_$CategorieToJson(this);
}