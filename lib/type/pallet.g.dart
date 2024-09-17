// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PalletAdapter extends TypeAdapter<Pallet> {
  @override
  final int typeId = 1;

  @override
  Pallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pallet(
      leftidle: fields[0] as String,
      leftfist: fields[1] as String,
      leftopen: fields[2] as String,
      leftpoint: fields[3] as String,
      leftvictory: fields[4] as String,
      leftrocknroll: fields[5] as String,
      leftgun: fields[6] as String,
      leftthumbsup: fields[7] as String,
      rightidle: fields[8] as String,
      rightfist: fields[9] as String,
      rightopen: fields[10] as String,
      rightpoint: fields[11] as String,
      rightvictory: fields[12] as String,
      rightrocknroll: fields[13] as String,
      rightgun: fields[14] as String,
      rightthumbsup: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Pallet obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.leftidle)
      ..writeByte(1)
      ..write(obj.leftfist)
      ..writeByte(2)
      ..write(obj.leftopen)
      ..writeByte(3)
      ..write(obj.leftpoint)
      ..writeByte(4)
      ..write(obj.leftvictory)
      ..writeByte(5)
      ..write(obj.leftrocknroll)
      ..writeByte(6)
      ..write(obj.leftgun)
      ..writeByte(7)
      ..write(obj.leftthumbsup)
      ..writeByte(8)
      ..write(obj.rightidle)
      ..writeByte(9)
      ..write(obj.rightfist)
      ..writeByte(10)
      ..write(obj.rightopen)
      ..writeByte(11)
      ..write(obj.rightpoint)
      ..writeByte(12)
      ..write(obj.rightvictory)
      ..writeByte(13)
      ..write(obj.rightrocknroll)
      ..writeByte(14)
      ..write(obj.rightgun)
      ..writeByte(15)
      ..write(obj.rightthumbsup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PalletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
