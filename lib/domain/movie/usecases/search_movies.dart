import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/movie/entities/movie.dart';
import 'package:bioskop_keren/domain/movie/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.searchMovies(query);
  }
}
