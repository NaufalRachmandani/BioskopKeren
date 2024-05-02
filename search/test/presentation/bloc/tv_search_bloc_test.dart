import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/tv/usecases/search_tvs.dart';
import 'package:search/presentation/bloc/tv_search_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_search_bloc_test.mocks.dart';

@GenerateMocks([SearchTvs])
void main() {
  late TvSearchBloc searchBloc;
  late MockSearchTvs mockSearchTvs;

  setUp(() {
    mockSearchTvs = MockSearchTvs();
    searchBloc = TvSearchBloc(mockSearchTvs);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, TvSearchEmptyState());
  });

  const tQuery = 'dark';

  blocTest<TvSearchBloc, TvSearchState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Right(testTvList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const TvOnQueryChangedEvent(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSearchLoadingState(),
      TvSearchHasDataState(testTvList),
    ],
    verify: (_) => [
      verify(mockSearchTvs.execute(tQuery)),
      const TvOnQueryChangedEvent(tQuery).props,
    ],
  );

  blocTest<TvSearchBloc, TvSearchState>(
    'Should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => const Right([]));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const TvOnQueryChangedEvent(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSearchLoadingState(),
      TvSearchEmptyState(),
    ],
    verify: (_) => [
      verify(mockSearchTvs.execute(tQuery)),
      const TvOnQueryChangedEvent(tQuery).props,
    ],
  );

  blocTest<TvSearchBloc, TvSearchState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const TvOnQueryChangedEvent(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSearchLoadingState(),
      const TvSearchErrorState('Server Failure'),
    ],
    verify: (_) => [
      verify(mockSearchTvs.execute(tQuery)),
      const TvOnQueryChangedEvent(tQuery).props,
    ],
  );
}
