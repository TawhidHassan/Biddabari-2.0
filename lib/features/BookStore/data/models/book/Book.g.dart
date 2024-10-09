// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['id'] as num?,
      json['product_author_id'] as num?,
      json['product_author'] == null
          ? null
          : User.fromJson(json['product_author'] as Map<String, dynamic>),
      json['price'] as String?,
      json['title'] as String?,
      json['featured_pdf'] as String?,
      json['pdf'] as String?,
      json['image'] as String?,
      json['slug'] as String?,
      json['description'] as String?,
      json['discount_amount'] as String?,
      json['discount_start_date'] as String?,
      json['discount_end_date'] as String?,
      json['about'] as String?,
      json['specification'] as String?,
      json['other_details'] as String?,
      json['stock_amount'] as num?,
      json['is_featured'] as num?,
      json['status'] as num?,
      json['has_discount_validity'] as String?,
      json['order_status'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'product_author_id': instance.product_author_id,
      'product_author': instance.product_author,
      'price': instance.price,
      'title': instance.title,
      'featured_pdf': instance.featured_pdf,
      'pdf': instance.pdf,
      'image': instance.image,
      'slug': instance.slug,
      'description': instance.description,
      'discount_amount': instance.discount_amount,
      'discount_start_date': instance.discount_start_date,
      'discount_end_date': instance.discount_end_date,
      'about': instance.about,
      'specification': instance.specification,
      'other_details': instance.other_details,
      'stock_amount': instance.stock_amount,
      'is_featured': instance.is_featured,
      'status': instance.status,
      'has_discount_validity': instance.has_discount_validity,
      'order_status': instance.order_status,
    };
