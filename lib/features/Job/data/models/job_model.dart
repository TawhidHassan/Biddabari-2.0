import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Job.dart';


part 'job_model.g.dart';

@JsonSerializable()
class JobModel  {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "circular_category_id")
  int? circularCategoryId;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "job_title")
  String? jobTitle;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "post_title")
  String? postTitle;
  @JsonKey(name: "vacancy")
  int? vacancy;
  @JsonKey(name: "about")
  String? about;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "publish_date")
  String? publishDate;
  @JsonKey(name: "publish_date_timestamp")
  String? publishDateTimestamp;
  @JsonKey(name: "expire_date")
  String? expireDate;
  @JsonKey(name: "expire_date_timestamp")
  String? expireDateTimestamp;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "is_featured")
  int? isFeatured;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;


  JobModel(
      this.id,
      this.slug,
      this.image,
      this.circularCategoryId,
      this.userId,
      this.jobTitle,
      this.createdAt,
      this.postTitle,
      this.vacancy,
      this.about,
      this.description,
      this.publishDate,
      this.publishDateTimestamp,
      this.expireDate,
      this.expireDateTimestamp,
      this.status,
      this.isFeatured,
      this.order,
      this.updatedAt);

  factory JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}