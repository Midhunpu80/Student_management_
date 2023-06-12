// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataFunctions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentgtAdapter extends TypeAdapter<studentgt> {
  @override
  final int typeId = 1;

  @override
  studentgt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentgt(
        id: fields[0] as dynamic,
        name: fields[1] as String,
        age: fields[2] as String,
        address: fields[3] as String,
        pincode: fields[4] as String,
        Photo: fields[5] as dynamic);
    /*  fullname: fields[6] as dynamic);*/
  }

  @override
  void write(BinaryWriter writer, studentgt obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.pincode)
      ..writeByte(5)
      ..write(obj.Photo);
    /*  ..writeByte(6)
      ..write(obj.fullname);*/
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentgtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
