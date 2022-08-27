import 'package:brtnewz/Ui/headlines/headlinesview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bookmarks/bookmarked_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BRT-newz'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "Headlines"),
              Tab(text: "Bookmark"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[Headlinesview(), BookmarkedView()],
        ),
      ),
    );
  }
}
