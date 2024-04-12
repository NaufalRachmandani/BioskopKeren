import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/entities/movie.dart';
import 'package:bioskop_keren/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
