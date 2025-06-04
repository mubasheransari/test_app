import 'package:hive/hive.dart';



@HiveType(typeId: 0)
class FavoriteProduct extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  double rating;

  FavoriteProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
  });
}
