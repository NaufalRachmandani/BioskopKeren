import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/movie/entities/movie_detail.dart';
import 'package:bioskop_keren/domain/movie/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveWatchlist {
  final MovieRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
