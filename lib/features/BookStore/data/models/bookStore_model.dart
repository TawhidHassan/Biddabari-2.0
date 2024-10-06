import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/BookStore.dart';


part 'bookStore_model.g.dart';

@JsonSerializable()
class BookStoreModel extends BookStore {

  String? name;
  BookStoreModel(this.name,);





  factory BookStoreModel.fromJson(Map<String, dynamic> json) => _$BookStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookStoreModelToJson(this);
}