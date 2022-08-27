import 'package:brtnewz/Ui/headlines/heading_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:hive_flutter/adapters.dart';

import '../../Api/NewsApi.dart';
import '../../model/BookMarked/bookmarked.dart';
import '../headlines/bloc/bloc/headlines_bloc.dart';

class BookmarkedView extends StatefulWidget {
  const BookmarkedView({Key? key}) : super(key: key);

  @override
  State<BookmarkedView> createState() => _BookmarkedViewState();
}

class _BookmarkedViewState extends State<BookmarkedView> {
  Box<bookmarkedmodel>? databox;
  @override
  void initState() {
    databox = Hive.box<bookmarkedmodel>("bookmarked");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: ValueListenableBuilder(
            valueListenable: databox!.listenable(),
            // ignore: non_constant_identifier_names
            builder: (context, Box<bookmarkedmodel> data, _) {
              List<String> keys = databox!.keys.cast<String>().toList();
              return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(3),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int i) {
                    final String key = keys[i];
                    final bookmarkedmodel? bkmodel = data.get(key);

                    return keys.length < 0
                        ? Center(
                            child: Text("No Bookmarked here!"),
                          )
                        : BlocProvider(
                            create: (context) => HeadlinesBloc(
                              RepositoryProvider.of<NewsArt>(context),
                            ),
                            child: BlogTile(
                              imageUrl: bkmodel!.image,
                              title: bkmodel.title,
                              date: bkmodel.date,
                              url: bkmodel.url,
                              bmkey: key,
                            ),
                          );
                  });
            }),
      ),
    );
  }
}
