// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';



part 'BookLocal.g.dart';

@HiveType(typeId: 0)
class BookLocal extends HiveObject{

  @HiveField(0)
  num? id;
  @HiveField(1)
  num? price;
  @HiveField(2)
  num? discount;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? tite;
  @HiveField(5)
  num? quantity;


  BookLocal(
      {this.id,
      this.price,
      this.discount,
      this.image,
      this.tite,
      this.quantity});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookLocal &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          price == other.price &&
          image == other.image &&
          tite == other.tite &&
          quantity == other.quantity;

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      image.hashCode ^
      tite.hashCode ^
      quantity.hashCode;
}