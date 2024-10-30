// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      json['success'] as bool?,
      json['message'] as String?,
      (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'comments': instance.comments,
    };
