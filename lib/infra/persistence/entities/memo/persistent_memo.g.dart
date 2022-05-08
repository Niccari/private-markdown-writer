// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_memo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersistentMemoAdapter extends TypeAdapter<PersistentMemo> {
  @override
  final int typeId = 1;

  @override
  PersistentMemo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersistentMemo(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      lastModifiedAt: fields[2] as DateTime,
      lastOpenedAt: fields[3] as DateTime,
      willDeleteAt: fields[4] as DateTime?,
      title: fields[5] as String,
      content: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersistentMemo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.lastModifiedAt)
      ..writeByte(3)
      ..write(obj.lastOpenedAt)
      ..writeByte(4)
      ..write(obj.willDeleteAt)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersistentMemoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
