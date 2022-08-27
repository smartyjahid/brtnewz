import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bookmarked_event.dart';
part 'bookmarked_state.dart';

class BookmarkedBloc extends Bloc<BookmarkedEvent, BookmarkedState> {
  BookmarkedBloc() : super(BookmarkedloadingState()) {
    on<OnloadingBookmarked>((event, emit) {});
    on<OnloadBookmarked>((event, emit) {});
    on<Addbookmark>((event, emit) {});
    on<Delatebookmarked>((event, emit) {});
  }
}
