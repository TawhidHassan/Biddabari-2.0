import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Blog.dart';


part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel extends Blog {

  String? name;
  BlogModel(this.name,);





  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}