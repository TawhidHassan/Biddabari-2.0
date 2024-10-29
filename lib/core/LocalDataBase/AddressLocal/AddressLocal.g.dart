// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddressLocal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressLocalAdapter extends TypeAdapter<AddressLocal> {
  @override
  final int typeId = 0;

  @override
  AddressLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressLocal(
      name: fields[1] as String?,
      number: fields[2] as String?,
      address: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressLocal obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
