// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{

  @JsonKey(name: "id")
  num? id;
  String? verification_code;
  String? mobile;
  String? name;
  String? email;
  String? email_verified_at;
  String? two_factor_secret;
  String? google_id;
  String? facebook_id;
  String? note;
  num? status;
  num? notification_status;
  String? role;
  String? photo;
  String? signature;
  String? firstname;
  String? lastname;
  String? language;
  String? bio;
  String? social;
  String? profile_photo_url;
  int? user_id;
  num? total_earning;
  num? total_withdraw;
  num? balance;
  String? affiliate_code;
  String? device_token;
  String? teacher_intro_video;
  String? demo_video_1;
  String? demo_video_2;
  String? teacher_intro_banner;
  String? demo_banner_1;
  String? demo_banner_2;


  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "image")
  dynamic image;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "present_address")
  dynamic presentAddress;
  @JsonKey(name: "permanent_address")
  dynamic permanentAddress;
  @JsonKey(name: "last_education")
  dynamic lastEducation;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "dob")
  dynamic dob;
  @JsonKey(name: "school")
  dynamic school;
  @JsonKey(name: "college")
  dynamic college;
  @JsonKey(name: "university")
  dynamic university;
  @JsonKey(name: "github")
  dynamic github;
  @JsonKey(name: "twitter")
  dynamic twitter;
  @JsonKey(name: "linkedin")
  dynamic linkedin;
  @JsonKey(name: "whatsapp")
  dynamic whatsapp;
  @JsonKey(name: "facebook")
  dynamic facebook;
  @JsonKey(name: "website")
  dynamic website;
  @JsonKey(name: "institute_name")
  dynamic instituteName;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "two_factor_confirmed_at")
  dynamic twoFactorConfirmedAt;
  @JsonKey(name: "current_team_id")
  dynamic currentTeamId;
  @JsonKey(name: "profile_photo_path")
  dynamic profilePhotoPath;

  dynamic subject;


  User(
      this.id,
      this.verification_code,
      this.mobile,
      this.name,
      this.email,
      this.email_verified_at,
      this.two_factor_secret,
      this.google_id,
      this.facebook_id,
      this.note,
      this.status,
      this.notification_status,
      this.role,
      this.photo,
      this.signature,
      this.firstname,
      this.lastname,
      this.language,
      this.bio,
      this.social,
      this.profile_photo_url,
      this.user_id,
      this.total_earning,
      this.total_withdraw,
      this.balance,
      this.affiliate_code,
      this.device_token,
      this.teacher_intro_video,
      this.demo_video_1,
      this.demo_video_2,
      this.teacher_intro_banner,
      this.demo_banner_1,
      this.demo_banner_2,
      this.firstName,
      this.lastName,
      this.image,
      this.description,
      this.presentAddress,
      this.permanentAddress,
      this.lastEducation,
      this.gender,
      this.dob,
      this.school,
      this.college,
      this.university,
      this.github,
      this.twitter,
      this.linkedin,
      this.whatsapp,
      this.facebook,
      this.website,
      this.instituteName,
      this.createdAt,
      this.updatedAt,
      this.twoFactorConfirmedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.subject);

  factory User.fromJson(Map<String,dynamic>json)=>
      _$UserFromJson(json);
  Map<String,dynamic>toJson()=>_$UserToJson(this);
}