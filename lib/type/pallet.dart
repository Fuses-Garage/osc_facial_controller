import 'package:hive/hive.dart';
part 'pallet.g.dart';

//表情名管理用クラス(typeIdはプロジェクト内で一意である必要がある)
@HiveType(typeId: 1)
class Pallet extends HiveObject {
  Pallet(
      {required this.leftidle,
      required this.leftfist,
      required this.leftopen,
      required this.leftpoint,
      required this.leftvictory,
      required this.leftrocknroll,
      required this.leftgun,
      required this.leftthumbsup,
      required this.rightidle,
      required this.rightfist,
      required this.rightopen,
      required this.rightpoint,
      required this.rightvictory,
      required this.rightrocknroll,
      required this.rightgun,
      required this.rightthumbsup});

  //HiveFieldのIndexはクラス内で一意でなければならない
  @HiveField(0)
  String leftidle;
  @HiveField(1)
  String leftfist;
  @HiveField(2)
  String leftopen;
  @HiveField(3)
  String leftpoint;
  @HiveField(4)
  String leftvictory;
  @HiveField(5)
  String leftrocknroll;
  @HiveField(6)
  String leftgun;
  @HiveField(7)
  String leftthumbsup;
  @HiveField(8)
  String rightidle;
  @HiveField(9)
  String rightfist;
  @HiveField(10)
  String rightopen;
  @HiveField(11)
  String rightpoint;
  @HiveField(12)
  String rightvictory;
  @HiveField(13)
  String rightrocknroll;
  @HiveField(14)
  String rightgun;
  @HiveField(15)
  String rightthumbsup;
}
