// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../AllCourse/data/models/course/Course.dart';
import '../../../../BookStore/data/models/book/Book.dart';
import '../../../../Exam/data/models/Exam.dart';




part 'Order.g.dart';

@JsonSerializable()
class Order{

  num? id;
  num? parent_model_id;
  num? user_id;
  num? total_amount;
  num? paid_amount;
  String? order_invoice_number;
  String? ordered_for;
  String? payment_status;
  String? status;
  Exam? batch_exam;
  Course? course;
  Book? product;


  Order(
      this.id,
      this.parent_model_id,
      this.user_id,
      this.total_amount,
      this.paid_amount,
      this.order_invoice_number,
      this.ordered_for,
      this.payment_status,
      this.status,
      this.batch_exam,
      this.course,
      this.product,
      );

  factory Order.fromJson(Map<String,dynamic>json)=>
      _$OrderFromJson(json);
  Map<String,dynamic>toJson()=>_$OrderToJson(this);
}