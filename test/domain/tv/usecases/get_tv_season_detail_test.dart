import 'package:bioskop_keren/domain/tv/usecases/get_tv_season_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeasonDetail usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvSeasonDetail(mockTvRepository);
  });

  const tId = 1;
  const tSeasonNumber = 1;

  test('should get tv season detail from the repository', () async {
    // arrange
    when(mockTvRepository.getTvSeasonDetail(tId, tSeasonNumber))
        .thenAnswer((_) async => Right(testSeasonDetailResponse.toEntity()));
    // act
    final result = await usecase.execute(tId, tSeasonNumber);
    // assert
    expect(result, Right(testSeasonDetailResponse.toEntity()));
  });
}
