part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

class SearchEmptyState extends MovieSearchState {}

class SearchLoadingState extends MovieSearchState {}

class SearchErrorState extends MovieSearchState {
  final String message;

  const SearchErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasDataState extends MovieSearchState {
  final List<Movie> result;

  const SearchHasDataState(this.result);

  @override
  List<Object> get props => [result];
}
