// ignore_for_file: must_be_immutable

import 'package:brtnewz/Ui/headlines/bloc/bloc/headlines_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../model/BookMarked/bookmarked.dart';
import '../../model/news_model_data.dart';
import 'fullviewer/Viewer_news.dart';

class BlogTile extends StatefulWidget {
  String imageUrl, title, date;
  String url, bmkey;

  BlogTile({
    Key? key,
    required this.bmkey,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.url,
  }) : super(key: key);

  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  Box<bookmarkedmodel>? databox;
  @override
  void initState() {
    databox = Hive.box<bookmarkedmodel>("bookmarked");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(blogUrl: widget.url)));
      },
      child: Stack(children: [
        Table(
          border: TableBorder.all(),
          // columnWidths: const <int, TableColumnWidth>{
          //   0: IntrinsicColumnWidth(),
          //   1: FlexColumnWidth(),
          //   2: FixedColumnWidth(64),
          // },
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: <TableRow>[
            TableRow(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.fitHeight,
                  )),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                widget.date,
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ]),
          ],
        ),
        databox!.containsKey(widget.bmkey)
            ? Positioned(
                bottom: 3,
                right: 5,
                child: BlocBuilder<HeadlinesBloc, HeadlinesState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          BlocProvider.of<HeadlinesBloc>(context)
                              .add(Delatebookmarkevent(
                            title: widget.title,
                          ));
                          //bookmarked;
                        },
                        icon: Icon(Icons.bookmark_remove));
                  },
                ),
              )
            : Positioned(
                bottom: 3,
                right: 5,
                child: BlocBuilder<HeadlinesBloc, HeadlinesState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          print("start");

                          BlocProvider.of<HeadlinesBloc>(context).add(
                              AddBookmakevent(
                                  image: widget.imageUrl,
                                  date: widget.date,
                                  title: widget.title,
                                  url: widget.url,
                                  ismarked: true));

                          //bookmarked;
                        },
                        icon: Icon(Icons.bookmark_add));
                  },
                ),
              )
      ]),
    );
  }
}
