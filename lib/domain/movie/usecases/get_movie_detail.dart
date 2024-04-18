import 'package:bioskop_keren/common/failure.dart';
import 'package:bioskop_keren/domain/movie/entities/movie_detail.dart';
import 'package:bioskop_keren/domain/movie/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}