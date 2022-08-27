import 'package:brtnewz/Ui/headlines/bloc/bloc/headlines_bloc.dart';
import 'package:brtnewz/Ui/headlines/heading_tile.dart';
import 'package:brtnewz/model/news_model_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Api/NewsApi.dart';
import '../Search_page/query_input.dart';

class Headlinesview extends StatefulWidget {
  const Headlinesview({Key? key}) : super(key: key);

  @override
  State<Headlinesview> createState() => _HeadlinesviewState();
}

class _HeadlinesviewState extends State<Headlinesview> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HeadlinesBloc(
              RepositoryProvider.of<NewsArt>(context),
            )..add(LoadApievent()),
        child: BlocBuilder<HeadlinesBloc, HeadlinesState>(
          builder: (context, state) {
            if (state is HeadlinesloadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HeadlinesloadState) {
              return RefreshIndicator(
                onRefresh: () async =>
                    BlocProvider.of<HeadlinesBloc>(context).add(LoadApievent()),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const Serchquery(),
                      // Blog........
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.articles.length,
                              itemBuilder: (context, i) {
                                return BlocProvider(
                                  create: (context) => HeadlinesBloc(
                                    RepositoryProvider.of<NewsArt>(context),
                                  ),
                                  child: BlogTile(
                                    imageUrl: state.articles[i].urlImage,
                                    title: state.articles[i].title,
                                    date: state.articles[i].date,
                                    url: state.articles[i].newsurl,
                                    bmkey: state.articles[i].title,
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Text("no Data found"),
            );
          },
        ));
  }
}
