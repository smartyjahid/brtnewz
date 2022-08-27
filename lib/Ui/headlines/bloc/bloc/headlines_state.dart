part of 'headlines_bloc.dart';

abstract class HeadlinesState extends Equatable {
  const HeadlinesState();
}

class HeadlinesloadingState extends HeadlinesState {
  @override
  List<Object> get props => [];
}

class HeadlinesloadState extends HeadlinesState {
  final List<Newzmodel> articles;
  const HeadlinesloadState(this.articles);
  @override
  List<Object> get props => [articles];
}

class AddHeadlinesState extends HeadlinesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Delateheadlinesstate extends HeadlinesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
