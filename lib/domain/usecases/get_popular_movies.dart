import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/entities/movie.dart';
import 'package:bioskop_keren/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovies();
  }
}
