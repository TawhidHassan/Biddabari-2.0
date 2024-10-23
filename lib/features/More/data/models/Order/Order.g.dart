// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'] as num?,
      json['parent_model_id'] as num?,
      json['user_id'] as num?,
      json['total_amount'] as num?,
      json['paid_amount'] as num?,
      json['order_invoice_number'] as String?,
      json['ordered_for'] as String?,
      json['payment_status'] as String?,
      json['status'] as String?,
      json['batch_exam'] == null
          ? null
          : Exam.fromJson(json['batch_exam'] as Map<String, dynamic>),
      json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      json['product'] == null
          ? null
          : Book.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'parent_model_id': instance.parent_model_id,
      'user_id': instance.user_id,
      'total_amount': instance.total_amount,
      'paid_amount': instance.paid_amount,
      'order_invoice_number': instance.order_invoice_number,
      'ordered_for': instance.ordered_for,
      'payment_status': instance.payment_status,
      'status': instance.status,
      'batch_exam': instance.batch_exam,
      'course': instance.course,
      'product': instance.product,
    };
