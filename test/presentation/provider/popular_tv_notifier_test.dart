import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/common/state_enum.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_popular_tvs.dart';
import 'package:bioskop_keren/presentation/provider/popular_tv_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_tv_notifier_test.mocks.dart';

@GenerateMocks([GetPopularTvs])
void main() {
  late MockGetPopularTvs mockGetPopularTvs;
  late PopularTvNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularTvs = MockGetPopularTvs();
    notifier = PopularTvNotifier(mockGetPopularTvs)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularTvs.execute())
        .thenAnswer((_) async => Right(testTvList));
    // act
    notifier.getPopularTvs();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetPopularTvs.execute())
        .thenAnswer((_) async => Right(testTvList));
    // act
    await notifier.getPopularTvs();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvs, testTvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularTvs.execute())
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await notifier.getPopularTvs();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
