import 'package:bioskop_keren/domain/tv/usecases/insert_watchlist_tv.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late InsertWatchlistTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = InsertWatchlistTv(mockTvRepository);
  });

  test('should save tv to the repository', () async {
    // arrange
    when(mockTvRepository.insertWatchlist(testTvDetail))
        .thenAnswer((_) async => const Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvDetail);
    // assert
    verify(mockTvRepository.insertWatchlist(testTvDetail));
    expect(result, const Right('Added to Watchlist'));
  });
}
