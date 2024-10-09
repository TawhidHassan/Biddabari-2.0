// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookLocal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookLocalAdapter extends TypeAdapter<BookLocal> {
  @override
  final int typeId = 0;

  @override
  BookLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookLocal(
      id: fields[0] as num?,
      price: fields[1] as num?,
      discount: fields[2] as num?,
      image: fields[3] as String?,
      tite: fields[4] as String?,
      quantity: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, BookLocal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.discount)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.tite)
      ..writeByte(5)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
