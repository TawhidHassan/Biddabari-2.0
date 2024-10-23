import 'package:json_annotation/json_annotation.dart';
import '../../../../core/common/data/Category/Categorie.dart';
import '../../domain/entities/Blog.dart';
import 'Blog/Blog.dart';


part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel extends Blog {

  String? name;
  BlogModel(this.name,) : super(null, null, null, null, null, null, '', '', '', '', '', '', '', '', null);





  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}