import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/tv/entities/tv_detail.dart';
import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveWatchlistTv {
  final TvRepository repository;

  RemoveWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.removeWatchlist(tv);
  }
}
