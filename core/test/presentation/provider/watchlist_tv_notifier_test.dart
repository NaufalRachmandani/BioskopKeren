import 'package:core/domain/tv/usecases/get_watchlist_tvs.dart';
import 'package:core/presentation/provider/watchlist_tv_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_notifier_test.mocks.dart';

@GenerateMocks([GetWatchlistTvs])
void main() {
  late MockGetWatchlistTvs mockGetWatchlistTvs;
  late WatchlistTvNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTvs = MockGetWatchlistTvs();
    notifier = WatchlistTvNotifier(
      getWatchlistTvUseCase: mockGetWatchlistTvs,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change tv data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistTvs.execute())
        .thenAnswer((_) async => const Right([testWatchlistTv]));
    // act
    await notifier.getWatchlistTv();
    // assert
    expect(notifier.watchlistState, RequestState.Loaded);
    expect(notifier.watchlistTv, [testWatchlistTv]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistTvs.execute())
        .thenAnswer((_) async => const Left(DatabaseFailure("Can't get data")));
    // act
    await notifier.getWatchlistTv();
    // assert
    expect(notifier.watchlistState, RequestState.Error);
    expect(notifier.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
