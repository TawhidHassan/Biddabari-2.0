// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';



part 'AddressLocal.g.dart';

@HiveType(typeId: 0)
class AddressLocal extends HiveObject{

  @HiveField(1)
  String? name;
  @HiveField(2)
  String? number;
  @HiveField(3)
  String? address;


  AddressLocal({this.name, this.number, this.address});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressLocal &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          number == other.number &&
          address == other.address;

  @override
  int get hashCode => name.hashCode ^ number.hashCode ^ address.hashCode;
}