import 'package:flutter/material.dart';

import '../../Api/NewsApi.dart';
import '../../model/news_model_data.dart';
import '../headlines/heading_tile.dart';

class Searchview extends StatefulWidget {
  String squery;

  Searchview({
    Key? key,
    required this.squery,
  }) : super(key: key);

  @override
  State<Searchview> createState() => _SearchviewState();
}

class _SearchviewState extends State<Searchview> {
  bool loading = true;
  // List<CategoryModel> categories = List<CategoryModel>();
  List<Newzmodel> searcharticles = <Newzmodel>[];

  @override
  void initState() {
    super.initState();
    searchNew(widget.squery);
  }

  searchNew(String query) async {
    SearchNews snews = SearchNews();
    await snews.geturl(query);
    searcharticles = snews.newsart;
    print(searcharticles[0].newsurl);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result's ${searcharticles.length}")),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Blog........
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: searcharticles.length,
                        itemBuilder: (context, i) {
                          return searcharticles.isEmpty
                              ? Center(
                                  child: Text(
                                      "No Data Found related: ${widget.squery}"),
                                )
                              : BlogTile(
                                  imageUrl: searcharticles[i].urlImage,
                                  title: searcharticles[i].title,
                                  date: searcharticles[i].date,
                                  url: searcharticles[i].newsurl,
                                  bmkey: searcharticles[i].title,
                                );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
