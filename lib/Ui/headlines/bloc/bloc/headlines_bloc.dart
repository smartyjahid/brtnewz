import 'package:bloc/bloc.dart';
import 'package:brtnewz/Ui/bookmarks/bookmarked_bloc/bloc/bookmarked_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../Api/NewsApi.dart';
import '../../../../model/BookMarked/bookmarked.dart';
import '../../../../model/news_model_data.dart';

part 'headlines_event.dart';
part 'headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesState> {
  final NewsArt newsart;

  HeadlinesBloc(this.newsart) : super(HeadlinesloadingState()) {
    on<LoadApievent>((event, emit) async {
      emit(HeadlinesloadingState());
      await newsart.geturl();
      emit(HeadlinesloadState(newsart.newsart));
    });

    on<AddBookmakevent>((event, emit) {
      final state = this.state;
      Box<bookmarkedmodel> databox = Hive.box<bookmarkedmodel>("bookmarked");
      // emit(databox);
      print("adding");
      databox
          .put(
              event.title,
              bookmarkedmodel(
                  title: event.title,
                  date: event.date,
                  url: event.url,
                  image: event.image,
                  ismarked: true))
          .whenComplete(() => print("data added"));
      emit(AddHeadlinesState());
    });
    on<Delatebookmarkevent>((event, emit) {
      final state = this.state;
      Box<bookmarkedmodel> databox = Hive.box<bookmarkedmodel>("bookmarked");
      // emit(databox);
      print("adding");

      databox.delete(event.title).whenComplete(() => print("data added"));
      emit(Delateheadlinesstate());
    });
  }
}
