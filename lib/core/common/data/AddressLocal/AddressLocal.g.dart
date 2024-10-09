// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddressLocal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressLocalAdapter extends TypeAdapter<AddressLocal> {
  @override
  final int typeId = 1;

  @override
  AddressLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressLocal(
      name: fields[6] as String?,
      number: fields[7] as String?,
      address: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressLocal obj) {
    writer
      ..writeByte(3)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.number)
      ..writeByte(8)
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
