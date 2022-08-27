part of 'bookmarked_bloc.dart';

abstract class BookmarkedState extends Equatable {
  const BookmarkedState();

  @override
  List<Object> get props => [];
}

class BookmarkedloadingState extends BookmarkedState {}

class BookmarkedloadedState extends BookmarkedState {}

class BookmarkedAddedState extends BookmarkedState {}

class BookmarkeddelateState extends BookmarkedState {}
