import 'dart:io';

import 'package:brtnewz/Api/NewsApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'Ui/homepage/Home_page.dart';
import 'model/BookMarked/bookmarked.dart';

const String offlinedata = "bookmarked";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory doc = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(bookmarkedmodelAdapter());
  Hive.init(doc.path);
  await Hive.openBox<bookmarkedmodel>(offlinedata);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRTnewz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
          providers: [RepositoryProvider(create: (context) => NewsArt())],
          child: HomePage()),
    );
  }
}
