import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/movie/entities/movie.dart';
import 'package:bioskop_keren/domain/movie/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
