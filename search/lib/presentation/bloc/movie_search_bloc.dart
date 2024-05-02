import 'package:core/domain/movie/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/movie/usecases/search_movies.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final SearchMovies _searchMovies;

  MovieSearchBloc(this._searchMovies) : super(SearchEmptyState()) {
    on<OnQueryChangedEvent>((event, emit) async {
      final query = event.query;

      emit(SearchLoadingState());

      final result = await _searchMovies.execute(query);
      result.fold(
        (failure) {
          emit(SearchErrorState(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(SearchEmptyState());
          } else {
            emit(SearchHasDataState(data));
          }
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
