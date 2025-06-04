// GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'favorite_product.dart';

import 'package:hive/hive.dart';

import '../Models/FavouriteModel/favourites_model.dart';

class FavoriteProductAdapter extends TypeAdapter<FavoriteProduct> {
  @override
  final int typeId = 0;

  @override
  FavoriteProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteProduct(
      id: fields[0] as int,
      name: fields[1] as String,
      price: fields[2] as double,
      rating: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteProduct obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
