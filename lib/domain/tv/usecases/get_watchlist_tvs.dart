import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';

class GetWatchlistTvs {
  final TvRepository repository;

  GetWatchlistTvs(this.repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return repository.getWatchlistTvs();
  }
}
