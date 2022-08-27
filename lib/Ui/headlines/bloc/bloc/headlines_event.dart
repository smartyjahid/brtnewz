part of 'headlines_bloc.dart';

abstract class HeadlinesEvent extends Equatable {
  const HeadlinesEvent();
}

class LoadApievent extends HeadlinesEvent {
  @override
  List<Object> get props => [];
}

class AddBookmakevent extends HeadlinesEvent {
  String image, url, title, date;
  bool ismarked;
  AddBookmakevent(
      {required this.image,
      required this.date,
      required this.title,
      required this.url,
      required this.ismarked});
  @override
  // TODO: implement props
  List<Object?> get props => [image, url, title, date, ismarked];
}

class Delatebookmarkevent extends HeadlinesEvent {
  String title;
  Delatebookmarkevent({required this.title});
  @override
  // TODO: implement props
  List<Object?> get props => [title];
}
