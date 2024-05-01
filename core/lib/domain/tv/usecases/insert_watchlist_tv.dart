import 'package:core/domain/tv/entities/tv_detail.dart';
import 'package:core/domain/tv/repositories/tv_repository.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class InsertWatchlistTv {
  final TvRepository repository;

  InsertWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.insertWatchlist(tv);
  }
}
