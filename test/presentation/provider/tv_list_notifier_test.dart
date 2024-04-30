import 'package:bioskop_keren/domain/tv/usecases/get_now_playing_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_popular_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_top_rated_tvs.dart';
import 'package:bioskop_keren/presentation/provider/tv_list_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_list_notifier_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvs, GetPopularTvs, GetTopRatedTvs])
void main() {
  late MockGetNowPlayingTvs mockGetNowPlayingTvs;
  late MockGetPopularTvs mockGetPopularTvs;
  late MockGetTopRatedTvs mockGetTopRatedTvs;
  late TvListNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTvs = MockGetNowPlayingTvs();
    mockGetPopularTvs = MockGetPopularTvs();
    mockGetTopRatedTvs = MockGetTopRatedTvs();
    notifier = TvListNotifier(
      getNowPlayingTvsUseCase: mockGetNowPlayingTvs,
      getPopularTvsUseCase: mockGetPopularTvs,
      getTopRatedTvsUseCase: mockGetTopRatedTvs,
    )..addListener(() {
        listenerCallCount++;
      });
  });

  group('now playing tv', () {
    test('initialState should be Empty', () {
      expect(notifier.nowPlayingState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetNowPlayingTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      notifier.getNowPlayingTvs();
      // assert
      verify(mockGetNowPlayingTvs.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      notifier.getNowPlayingTvs();
      // assert
      expect(notifier.nowPlayingState, RequestState.Loading);
    });

    test('should change tv when data is gotten successfully', () async {
      // arrange
      when(mockGetNowPlayingTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      await notifier.getNowPlayingTvs();
      // assert
      expect(notifier.nowPlayingState, RequestState.Loaded);
      expect(notifier.nowPlayingTvs, testTvList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingTvs.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await notifier.getNowPlayingTvs();
      // assert
      expect(notifier.nowPlayingState, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular tv', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      notifier.getPopularTvs();
      // assert
      expect(notifier.popularTvsState, RequestState.Loading);
      // verify(notifier.setState(RequestState.Loading));
    });

    test('should change tv data when data is gotten successfully', () async {
      // arrange
      when(mockGetPopularTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      await notifier.getPopularTvs();
      // assert
      expect(notifier.popularTvsState, RequestState.Loaded);
      expect(notifier.popularTvs, testTvList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvs.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await notifier.getPopularTvs();
      // assert
      expect(notifier.popularTvsState, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated tv', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      notifier.getTopRatedTvs();
      // assert
      expect(notifier.topRatedTvsState, RequestState.Loading);
    });

    test('should change tv data when data is gotten successfully', () async {
      // arrange
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      // act
      await notifier.getTopRatedTvs();
      // assert
      expect(notifier.topRatedTvsState, RequestState.Loaded);
      expect(notifier.topRatedTvs, testTvList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await notifier.getTopRatedTvs();
      // assert
      expect(notifier.topRatedTvsState, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
