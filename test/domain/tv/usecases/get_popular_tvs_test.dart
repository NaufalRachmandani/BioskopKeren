import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_popular_tvs.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvs usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetPopularTvs(mockTvRepository);
  });

  final tTv = <Tv>[];

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.getPopularTvs()).thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTv));
  });
}
