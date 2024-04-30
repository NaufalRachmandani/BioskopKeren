import 'package:bioskop_keren/domain/tv/usecases/get_tv_by_id.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_tv_detail.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_tv_recommendations.dart';
import 'package:bioskop_keren/domain/tv/usecases/insert_watchlist_tv.dart';
import 'package:bioskop_keren/domain/tv/usecases/remove_watchlist_tv.dart';
import 'package:bioskop_keren/presentation/provider/tv_detail_notifier.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTvDetail,
  GetTvRecommendations,
  GetTvById,
  InsertWatchlistTv,
  RemoveWatchlistTv
])
void main() {
  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;
  late MockGetTvById mockGetTvById;
  late MockInsertWatchlistTv mockInsertWatchlistTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;
  late TvDetailNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendations();
    mockGetTvById = MockGetTvById();
    mockInsertWatchlistTv = MockInsertWatchlistTv();
    mockRemoveWatchlistTv = MockRemoveWatchlistTv();
    notifier = TvDetailNotifier(
      getTvDetailUseCase: mockGetTvDetail,
      getTvRecommendationsUseCase: mockGetTvRecommendations,
      getTvByIdUseCase: mockGetTvById,
      insertWatchlistTvUseCase: mockInsertWatchlistTv,
      removeWatchlistTvUseCase: mockRemoveWatchlistTv,
    )..addListener(() {
        listenerCallCount++;
      });
  });

  const tId = 1;

  void _arrangeUsecase() {
    when(mockGetTvDetail.execute(tId))
        .thenAnswer((_) async => const Right(testTvDetail));
    when(mockGetTvRecommendations.execute(tId))
        .thenAnswer((_) async => Right(testTvList));
  }

  group('Get TV Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await notifier.getTvDetail(tId);
      // assert
      verify(mockGetTvDetail.execute(tId));
      verify(mockGetTvRecommendations.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      notifier.getTvDetail(tId);
      // assert
      expect(notifier.tvDetailState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change tv when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await notifier.getTvDetail(tId);
      // assert
      expect(notifier.tvDetailState, RequestState.Loaded);
      expect(notifier.tvDetail, testTvDetail);
      expect(listenerCallCount, 3);
    });

    test('should change recommendation tv when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await notifier.getTvDetail(tId);
      // assert
      expect(notifier.tvDetailState, RequestState.Loaded);
      expect(notifier.tvRecommendations, testTvList);
    });
  });

  group('Get tv Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await notifier.getTvDetail(tId);
      // assert
      verify(mockGetTvRecommendations.execute(tId));
      expect(notifier.tvRecommendations, testTvList);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await notifier.getTvDetail(tId);
      // assert
      expect(notifier.recommendationState, RequestState.Loaded);
      expect(notifier.tvRecommendations, testTvList);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetTvDetail.execute(tId))
          .thenAnswer((_) async => const Right(testTvDetail));
      when(mockGetTvRecommendations.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Failed')));
      // act
      await notifier.getTvDetail(tId);
      // assert
      expect(notifier.recommendationState, RequestState.Error);
      expect(notifier.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetTvById.execute(1)).thenAnswer((_) async => true);
      // act
      await notifier.getTvById(1);
      // assert
      expect(notifier.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockInsertWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetTvById.execute(testTvDetail.id))
          .thenAnswer((_) async => true);
      // act
      await notifier.insertWatchlistTv(testTvDetail);
      // assert
      verify(mockInsertWatchlistTv.execute(testTvDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetTvById.execute(testTvDetail.id))
          .thenAnswer((_) async => false);
      // act
      await notifier.removeWatchlistTv(testTvDetail);
      // assert
      verify(mockRemoveWatchlistTv.execute(testTvDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockInsertWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Right('Added to Watchlist'));
      when(mockGetTvById.execute(testTvDetail.id))
          .thenAnswer((_) async => true);
      // act
      await notifier.insertWatchlistTv(testTvDetail);
      // assert
      verify(mockGetTvById.execute(testTvDetail.id));
      expect(notifier.isAddedToWatchlist, true);
      expect(notifier.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockInsertWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      when(mockGetTvById.execute(testTvDetail.id))
          .thenAnswer((_) async => false);
      // act
      await notifier.insertWatchlistTv(testTvDetail);
      // assert
      expect(notifier.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvDetail.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetTvRecommendations.execute(tId))
          .thenAnswer((_) async => Right(testTvList));
      // act
      await notifier.getTvDetail(tId);
      // assert
      expect(notifier.tvDetailState, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
