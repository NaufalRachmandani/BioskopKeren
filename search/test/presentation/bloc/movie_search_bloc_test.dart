import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/movie/entities/movie.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/movie/usecases/search_movies.dart';
import 'package:search/presentation/bloc/movie_search_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_search_bloc_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late MovieSearchBloc searchBloc;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchBloc = MovieSearchBloc(mockSearchMovies);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchEmptyState());
  });

  final tMovieList = <Movie>[testMovie];
  const tQuery = 'spiderman';

  blocTest<MovieSearchBloc, MovieSearchState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute(tQuery))
          .thenAnswer((_) async => Right(tMovieList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChangedEvent(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoadingState(),
      SearchHasDataState(tMovieList),
    ],
    verify: (_) => [
      verify(mockSearchMovies.execute(tQuery)),
      const OnQueryChangedEvent(tQuery).props,
    ],
  );

  blocTest<MovieSearchBloc, MovieSearchState>(
    'Should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockSearchMovies.execute(tQuery))
          .thenAnswer((_) async => const Right([]));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChangedEvent(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoadingState(),
      SearchEmptyState(),
    ],
    verify: (_) => [
      verify(mockSearchMovies.execute(tQuery)),
      const OnQueryChangedEvent(tQuery).props,
    ],
  );

  blocTest<MovieSearchBloc, MovieSearchState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchMovies.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChangedEvent(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoadingState(),
      const SearchErrorState('Server Failure'),
    ],
    verify: (_) => [
      verify(mockSearchMovies.execute(tQuery)),
      const OnQueryChangedEvent(tQuery).props,
    ],
  );
}
