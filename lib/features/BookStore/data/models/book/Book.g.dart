// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as num?,
      product_author_id: json['product_author_id'] as num?,
      product_author: json['product_author'] == null
          ? null
          : User.fromJson(json['product_author'] as Map<String, dynamic>),
      price: json['price'] as String?,
      title: json['title'] as String?,
      featured_pdf: json['featured_pdf'] as String?,
      pdf: json['pdf'] as String?,
      image: json['image'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      discount_amount: json['discount_amount'] as String?,
      discount_start_date: json['discount_start_date'] as String?,
      discount_end_date: json['discount_end_date'] as String?,
      about: json['about'] as String?,
      specification: json['specification'] as String?,
      other_details: json['other_details'] as String?,
      stock_amount: json['stock_amount'] as num?,
      is_featured: json['is_featured'] as num?,
      status: json['status'] as num?,
      has_discount_validity: json['has_discount_validity'] as String?,
      order_status: json['order_status'] as String?,
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
