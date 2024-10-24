// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';



part 'BatchExamSectionContent.g.dart';

@JsonSerializable()
class BatchExamSectionContent{

  @JsonKey(name: "id")
  num? id;
  @JsonKey(name: "course_section_id")
  num? courseSectionId;
  @JsonKey(name: "parent_id")
  dynamic parentId;
  @JsonKey(name: "content_type")
  String? contentType;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "pdf_link")
  dynamic pdfLink;
  @JsonKey(name: "pdf_file")
  String? pdfFile;
  @JsonKey(name: "note_content")
  dynamic noteContent;
  @JsonKey(name: "video_link")
  dynamic videoLink;
  @JsonKey(name: "video_vendor")
  dynamic videoVendor;
  @JsonKey(name: "live_source_type")
  dynamic liveSourceType;
  @JsonKey(name: "live_link")
  dynamic liveLink;
  @JsonKey(name: "live_start_time")
  dynamic liveStartTime;
  @JsonKey(name: "live_start_time_timestamp")
  dynamic liveStartTimeTimestamp;
  @JsonKey(name: "live_end_time")
  dynamic liveEndTime;
  @JsonKey(name: "live_end_time_timestamp")
  dynamic liveEndTimeTimestamp;
  @JsonKey(name: "live_msg")
  dynamic liveMsg;
  @JsonKey(name: "regular_link")
  dynamic regularLink;
  @JsonKey(name: "assignment_question")
  dynamic assignmentQuestion;
  @JsonKey(name: "assignment_instruction")
  dynamic assignmentInstruction;
  @JsonKey(name: "assignment_total_mark")
  dynamic assignmentTotalMark;
  @JsonKey(name: "assignment_pass_mark")
  dynamic assignmentPassMark;
  @JsonKey(name: "assignment_start_time")
  dynamic assignmentStartTime;
  @JsonKey(name: "assignment_start_time_timestamp")
  dynamic assignmentStartTimeTimestamp;
  @JsonKey(name: "assignment_end_time")
  dynamic assignmentEndTime;
  @JsonKey(name: "assignment_end_time_timestamp")
  dynamic assignmentEndTimeTimestamp;
  @JsonKey(name: "assignment_result_publish_time")
  dynamic assignmentResultPublishTime;
  @JsonKey(name: "assignment_result_publish_time_timestamp")
  dynamic assignmentResultPublishTimeTimestamp;
  @JsonKey(name: "testmoj_link")
  dynamic testmojLink;
  @JsonKey(name: "testmoj_result_link")
  dynamic testmojResultLink;
  @JsonKey(name: "testmoj_xm_duration_in_minutes")
  dynamic testmojXmDurationInMinutes;
  @JsonKey(name: "testmoj_total_questions")
  dynamic testmojTotalQuestions;
  @JsonKey(name: "testmoj_start_time")
  dynamic testmojStartTime;
  @JsonKey(name: "testmoj_start_time_timestamp")
  dynamic testmojStartTimeTimestamp;
  @JsonKey(name: "testmoj_result_publish_time")
  dynamic testmojResultPublishTime;
  @JsonKey(name: "testmoj_result_publish_time_timestamp")
  dynamic testmojResultPublishTimeTimestamp;
  @JsonKey(name: "exam_mode")
  dynamic examMode;
  @JsonKey(name: "exam_duration_in_minutes")
  dynamic examDurationInMinutes;
  @JsonKey(name: "exam_total_questions")
  dynamic examTotalQuestions;
  @JsonKey(name: "exam_per_question_mark")
  num? examPerQuestionMark;
  @JsonKey(name: "exam_negative_mark")
  num? examNegativeMark;
  @JsonKey(name: "exam_pass_mark")
  dynamic examPassMark;
  @JsonKey(name: "exam_is_strict")
  num? examIsStrict;
  @JsonKey(name: "exam_start_time")
  dynamic examStartTime;
  @JsonKey(name: "exam_start_time_timestamp")
  dynamic examStartTimeTimestamp;
  @JsonKey(name: "exam_end_time")
  dynamic examEndTime;
  @JsonKey(name: "exam_end_time_timestamp")
  dynamic examEndTimeTimestamp;
  @JsonKey(name: "exam_result_publish_time")
  dynamic examResultPublishTime;
  @JsonKey(name: "exam_result_publish_time_timestamp")
  dynamic examResultPublishTimeTimestamp;
  @JsonKey(name: "exam_total_subject")
  dynamic examTotalSubject;
  @JsonKey(name: "written_exam_duration_in_minutes")
  dynamic writtenExamDurationInMinutes;
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
  num? isPaid;
  @JsonKey(name: "order")
  num? order;
  @JsonKey(name: "status")
  num? status;
  @JsonKey(name: "available_at")
  String? availableAt;
  @JsonKey(name: "available_at_timestamp")
  String? availableAtTimestamp;
  @JsonKey(name: "has_class_xm")
  num? hasClassXm;
  @JsonKey(name: "course_section_content_id")
  dynamic BatchExamSectionContentId;
  @JsonKey(name: "class_xm_mark")
  num? classXmMark;
  @JsonKey(name: "is_class_xm_complete")
  num? isClassXmComplete;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "classXmStatus")
  String? classXmStatus;


  BatchExamSectionContent(
      this.id,
      this.courseSectionId,
      this.parentId,
      this.contentType,
      this.title,
      this.pdfLink,
      this.pdfFile,
      this.noteContent,
      this.videoLink,
      this.videoVendor,
      this.liveSourceType,
      this.liveLink,
      this.liveStartTime,
      this.liveStartTimeTimestamp,
      this.liveEndTime,
      this.liveEndTimeTimestamp,
      this.liveMsg,
      this.regularLink,
      this.assignmentQuestion,
      this.assignmentInstruction,
      this.assignmentTotalMark,
      this.assignmentPassMark,
      this.assignmentStartTime,
      this.assignmentStartTimeTimestamp,
      this.assignmentEndTime,
      this.assignmentEndTimeTimestamp,
      this.assignmentResultPublishTime,
      this.assignmentResultPublishTimeTimestamp,
      this.testmojLink,
      this.testmojResultLink,
      this.testmojXmDurationInMinutes,
      this.testmojTotalQuestions,
      this.testmojStartTime,
      this.testmojStartTimeTimestamp,
      this.testmojResultPublishTime,
      this.testmojResultPublishTimeTimestamp,
      this.examMode,
      this.examDurationInMinutes,
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
      this.order,
      this.status,
      this.availableAt,
      this.availableAtTimestamp,
      this.hasClassXm,
      this.BatchExamSectionContentId,
      this.classXmMark,
      this.isClassXmComplete,
      this.createdAt,
      this.updatedAt,
      this.classXmStatus);

  factory BatchExamSectionContent.fromJson(Map<String,dynamic>json)=>
      _$BatchExamSectionContentFromJson(json);
  Map<String,dynamic>toJson()=>_$BatchExamSectionContentToJson(this);
}