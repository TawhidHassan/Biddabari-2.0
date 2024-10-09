// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/common/data/user/User.dart';



part 'Book.g.dart';

@JsonSerializable()
class Book{

  num? id;
  num? product_author_id;
  User? product_author;
  String? price;
  String? title;
  String? featured_pdf;
  String? pdf;
  String? image;
  String? slug;
  String? description;
  String? discount_amount;
  String? discount_start_date;
  String? discount_end_date;
  String? about;
  String? specification;
  String? other_details;
  num? stock_amount;
  num? is_featured;
  num? status;
  String?has_discount_validity;
  String?order_status;


  Book(
      this.id,
      this.product_author_id,
      this.product_author,
      this.price,
      this.title,
      this.featured_pdf,
      this.pdf,
      this.image,
      this.slug,
      this.description,
      this.discount_amount,
      this.discount_start_date,
      this.discount_end_date,
      this.about,
      this.specification,
      this.other_details,
      this.stock_amount,
      this.is_featured,
      this.status,
      this.has_discount_validity,
      this.order_status);

  factory Book.fromJson(Map<String,dynamic>json)=>
      _$BookFromJson(json);
  Map<String,dynamic>toJson()=>_$BookToJson(this);
}