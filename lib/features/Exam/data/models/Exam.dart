// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/common/data/user/User.dart';
import '../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import 'Question/Question.dart';



part 'Exam.g.dart';

@JsonSerializable()
class Exam{

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "course_section_id")
  int? courseSectionId;
  @JsonKey(name: "parent_id")
  dynamic parentId;
  @JsonKey(name: "content_type")
  String? contentType;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "exam_mode")
  String? examMode;
  @JsonKey(name: "exam_duration_in_minutes")
  int? examDurationInMinutes;
  @JsonKey(name: "class_xm_duration_in_minutes")
  int? classExamDurationInMinutes;
  @JsonKey(name: "exam_total_questions")
  String? examTotalQuestions;
  @JsonKey(name: "exam_per_question_mark")
  int? examPerQuestionMark;
  @JsonKey(name: "exam_negative_mark")
  double? examNegativeMark;
  @JsonKey(name: "exam_pass_mark")
  int? examPassMark;
  @JsonKey(name: "exam_is_strict")
  int? examIsStrict;
  @JsonKey(name: "exam_start_time")
  String? examStartTime;
  @JsonKey(name: "exam_start_time_timestamp")
  String? examStartTimeTimestamp;
  @JsonKey(name: "exam_end_time")
  String? examEndTime;
  @JsonKey(name: "exam_end_time_timestamp")
  String? examEndTimeTimestamp;
  @JsonKey(name: "exam_result_publish_time")
  dynamic examResultPublishTime;
  @JsonKey(name: "exam_result_publish_time_timestamp")
  String? examResultPublishTimeTimestamp;
  @JsonKey(name: "exam_total_subject")
  dynamic examTotalSubject;
  @JsonKey(name: "written_exam_duration_in_minutes")
  num? writtenExamDurationInMinutes;
  @JsonKey(name: "written_total_questions")
  dynamic writtenTotalQuestions;
  @JsonKey(name: "written_description")
  dynamic writtenDescription;
  @JsonKey(name: "written_is_strict")
  dynamic writtenIsStrict;
  @JsonKey(name: "written_start_time")
  dynamic writtenStartTime;
  @JsonKey(name: "written_start_time_timestamp")
  dynamic writtenStartTimeTimestamp;
  @JsonKey(name: "written_end_time")
  dynamic writtenEndTime;
  @JsonKey(name: "written_end_time_timestamp")
  dynamic writtenEndTimeTimestamp;
  @JsonKey(name: "written_publish_time")
  dynamic writtenPublishTime;
  @JsonKey(name: "written_publish_time_timestamp")
  dynamic writtenPublishTimeTimestamp;
  @JsonKey(name: "written_total_subject")
  dynamic writtenTotalSubject;
  @JsonKey(name: "is_paid")
  int? isPaid;
  @JsonKey(name: "has_class_xm")
  int? hasClassXm;
  @JsonKey(name: "course_section_content_id")
  dynamic courseSectionContentId;
  @JsonKey(name: "status")
  dynamic status;

  num? totalPdf;
  num? totalExam;

  String? description;
  String? purchase_status;
  num? is_master_exam;



  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "xm_type")
  String? xmType;
  @JsonKey(name: "written_xm_file")
  dynamic writtenXmFile;
  @JsonKey(name: "provided_ans")
  String? providedAns;
  String? banner;
  @JsonKey(name: "result_mark")
  num? resultMark;
  @JsonKey(name: "is_reviewed")
  int? isReviewed;
  @JsonKey(name: "required_time")
  int? requiredTime;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  User? user;
  @JsonKey(name: "course_section_content")
  CourseSectionContent? courseSectionContent;

  @JsonKey(name: "question_stores")
  List<Question>? questionStores;

  @JsonKey(name: "question_stores_for_class_xm")
  List<Question>? questionStoresClassExam;

  @JsonKey(name: "batch_exam_subscriptions")
  List<Exam>? batchExamSubscriptions;


  @JsonKey(name: "batch_exam_id")
  int? batchExamId;
  @JsonKey(name: "price")
  dynamic price;

  @JsonKey(name: "package_duration_in_days")
  int? packageDurationInDays;
  @JsonKey(name: "package_title")
  String? packageTitle;
  @JsonKey(name: "discount_amount")
  dynamic discountAmount;
  @JsonKey(name: "discount_start_date")
  String? discountStartDate;
  @JsonKey(name: "discount_end_date")
  String? discountEndDate;

  num? total_right_ans;
  num? total_wrong_ans;
  num? total_provided_ans;


  Exam(
      this.id,
      this.courseSectionId,
      this.parentId,
      this.contentType,
      this.title,
      this.examMode,
      this.examDurationInMinutes,
      this.classExamDurationInMinutes,
      this.examTotalQuestions,
      this.examPerQuestionMark,
      this.examNegativeMark,
      this.examPassMark,
      this.examIsStrict,
      this.examStartTime,
      this.examStartTimeTimestamp,
      this.examEndTime,
      this.examEndTimeTimestamp,
      this.examResultPublishTime,
      this.examResultPublishTimeTimestamp,
      this.examTotalSubject,
      this.writtenExamDurationInMinutes,
      this.writtenTotalQuestions,
      this.writtenDescription,
      this.writtenIsStrict,
      this.writtenStartTime,
      this.writtenStartTimeTimestamp,
      this.writtenEndTime,
      this.writtenEndTimeTimestamp,
      this.writtenPublishTime,
      this.writtenPublishTimeTimestamp,
      this.writtenTotalSubject,
      this.isPaid,
      this.hasClassXm,
      this.courseSectionContentId,
      this.status,
      this.totalPdf,
      this.totalExam,
      this.description,
      this.purchase_status,
      this.is_master_exam,
      this.userId,
      this.xmType,
      this.writtenXmFile,
      this.providedAns,
      this.banner,
      this.resultMark,
      this.isReviewed,
      this.requiredTime,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.courseSectionContent,
      this.questionStores,
      this.questionStoresClassExam,
      this.batchExamSubscriptions,
      this.batchExamId,
      this.price,
      this.packageDurationInDays,
      this.packageTitle,
      this.discountAmount,
      this.discountStartDate,
      this.discountEndDate,
      this.total_right_ans,
      this.total_wrong_ans,
      this.total_provided_ans,


      );

  factory Exam.fromJson(Map<String,dynamic>json)=>
      _$ExamFromJson(json);
  Map<String,dynamic>toJson()=>_$ExamToJson(this);
}