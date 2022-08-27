import 'package:brtnewz/model/BookMarked/bookmarked.dart';
import 'package:hive_flutter/adapters.dart';

class Offlinedata {
  Box<bookmarkedmodel> databox = Hive.box<bookmarkedmodel>("bookmarked");
}
