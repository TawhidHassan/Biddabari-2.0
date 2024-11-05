import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Exam/data/models/Exam.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/search.dart';


part 'search_model.g.dart';

@JsonSerializable()
class SearchModel extends Search {


  List<Course>?courses;
  List<Exam>?batchExams;
  List<Book>?products;


  SearchModel(this.courses, this.batchExams, this.products);

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}