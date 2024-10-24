// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
part 'Gallary.g.dart';

@JsonSerializable()
class Gallary{


  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "sub_title")
  String? subTitle;
  @JsonKey(name: "banner")
  String? banner;
  @JsonKey(name: "gallery_id")
  int? galleryId;
  @JsonKey(name: "image_url")
  String? imageUrl;

  List<Gallary>?gallery_images;


  Gallary(this.id, this.title, this.subTitle, this.banner, this.galleryId,
      this.imageUrl, this.gallery_images);

  factory Gallary.fromJson(Map<String,dynamic>json)=>
      _$GallaryFromJson(json);
  Map<String,dynamic>toJson()=>_$GallaryToJson(this);
}