// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';




@JsonSerializable()
class LoacalVideo{

  int? status;
  int? progress;
  String? id;
  String? filename;
  String? savedDirectory;

  LoacalVideo(
      this.status, this.progress, this.id, this.filename, this.savedDirectory);
}