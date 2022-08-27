// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';

part 'bookmarked.g.dart';

@HiveType(typeId: 0)
class bookmarkedmodel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final bool ismarked;

  bookmarkedmodel(
      {required this.ismarked,
      required this.title,
      required this.url,
      required this.date,
      required this.image});
}
