// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseSectionContentResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSectionContentResponse _$CourseSectionContentResponseFromJson(
        Map<String, dynamic> json) =>
    CourseSectionContentResponse(
      (json['courseClassContents'] as List<dynamic>?)
          ?.map((e) => CourseSectionContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseSectionContentResponseToJson(
        CourseSectionContentResponse instance) =>
    <String, dynamic>{
      'courseClassContents': instance.courseClassContents,
    };
