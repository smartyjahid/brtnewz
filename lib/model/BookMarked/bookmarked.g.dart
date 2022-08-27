// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarked.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bookmarkedmodelAdapter extends TypeAdapter<bookmarkedmodel> {
  @override
  final int typeId = 0;

  @override
  bookmarkedmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return bookmarkedmodel(
      ismarked: fields[4] as bool,
      title: fields[0] as String,
      url: fields[1] as String,
      date: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, bookmarkedmodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.ismarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bookmarkedmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
