// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as int?,
      questionType: json['question_type'] as String?,
      question: json['question'] as String?,
      mcq_ans_description: json['mcq_ans_description'] as String?,
      questionImage: json['question_image'],
      questionVideoLink: json['question_video_link'],
      hasAllWrongAns: json['has_all_wrong_ans'],
      status: json['status'] as int?,
      subjectName: json['subject_name'],
      answer: json['answer'] as String?,
      isfixed: json['isfixed'] as bool? ?? false,
      question_options: (json['question_options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question_type': instance.questionType,
      'question': instance.question,
      'mcq_ans_description': instance.mcq_ans_description,
      'question_image': instance.questionImage,
      'question_video_link': instance.questionVideoLink,
      'has_all_wrong_ans': instance.hasAllWrongAns,
      'status': instance.status,
      'subject_name': instance.subjectName,
      'answer': instance.answer,
      'isfixed': instance.isfixed,
      'question_options': instance.question_options,
    };
