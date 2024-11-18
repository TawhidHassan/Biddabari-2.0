// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Categorie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorie _$CategorieFromJson(Map<String, dynamic> json) => Categorie(
      id: json['id'] as num?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      slug: json['slug'] as String?,
      circulars: (json['circulars'] as List<dynamic>?)
          ?.map((e) => JobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..parentId = json['parentId'] as String?;

Map<String, dynamic> _$CategorieToJson(Categorie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'image': instance.image,
      'parentId': instance.parentId,
      'slug': instance.slug,
      'circulars': instance.circulars,
    };
