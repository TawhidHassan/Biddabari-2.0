// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../Exam.dart';


part 'MasterExam.g.dart';

@JsonSerializable()
class MasterExam{

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "sub_title")
  String? subTitle;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "banner")
  String? banner;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "featured_video_url")
  String? featuredVideoUrl;
  @JsonKey(name: "package_duration_in_days")
  int? packageDurationInDays;
  @JsonKey(name: "discount_type")
  int? discountType;
  @JsonKey(name: "discount_amount")
  dynamic discountAmount;
  @JsonKey(name: "discount_start_date")
  dynamic discountStartDate;
  @JsonKey(name: "discount_start_date_timestamp")
  dynamic discountStartDateTimestamp;
  @JsonKey(name: "discount_end_date")
  dynamic discountEndDate;
  @JsonKey(name: "discount_end_date_timestamp")
  dynamic discountEndDateTimestamp;
  @JsonKey(name: "is_paid")
  int? isPaid;
  @JsonKey(name: "is_featured")
  int? isFeatured;
  @JsonKey(name: "is_approved")
  int? isApproved;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "is_master_exam")
  int? isMasterExam;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "purchase_status")
  String? purchaseStatus;
  List<Exam>? batch_exam_subscriptions;


  MasterExam(
      this.id,
      this.title,
      this.slug,
      this.subTitle,
      this.price,
      this.banner,
      this.description,
      this.featuredVideoUrl,
      this.packageDurationInDays,
      this.discountType,
      this.discountAmount,
      this.discountStartDate,
      this.discountStartDateTimestamp,
      this.discountEndDate,
      this.discountEndDateTimestamp,
      this.isPaid,
      this.isFeatured,
      this.isApproved,
      this.status,
      this.isMasterExam,
      this.createdAt,
      this.updatedAt,
      this.purchaseStatus,
      this.batch_exam_subscriptions);

  factory MasterExam.fromJson(Map<String,dynamic>json)=>
      _$MasterExamFromJson(json);
  Map<String,dynamic>toJson()=>_$MasterExamToJson(this);
}