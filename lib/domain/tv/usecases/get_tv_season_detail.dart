import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/tv/entities/season_detail.dart';
import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvSeasonDetail {
  final TvRepository repository;

  GetTvSeasonDetail(this.repository);

  Future<Either<Failure, SeasonDetail>> execute(
    int id,
    int seasonNumber,
  ) {
    return repository.getTvSeasonDetail(id, seasonNumber);
  }
}
