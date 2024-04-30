import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingTvs {
  final TvRepository repository;

  GetNowPlayingTvs(this.repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return repository.getNowPlayingTvs();
  }
}
