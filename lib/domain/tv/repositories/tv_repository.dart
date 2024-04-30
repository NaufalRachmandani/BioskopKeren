import 'package:bioskop_keren/domain/tv/entities/season_detail.dart';
import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:bioskop_keren/domain/tv/entities/tv_detail.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getNowPlayingTvs();

  Future<Either<Failure, List<Tv>>> getPopularTvs();

  Future<Either<Failure, List<Tv>>> getTopRatedTvs();

  Future<Either<Failure, TvDetail>> getTvDetail(int id);

  Future<Either<Failure, List<Tv>>> getTvRecommendations(int id);

  Future<Either<Failure, SeasonDetail>> getTvSeasonDetail(
      int id, int seasonNumber);

  Future<Either<Failure, List<Tv>>> searchTvs(String query);

  Future<Either<Failure, String>> insertWatchlist(TvDetail tv);

  Future<Either<Failure, String>> removeWatchlist(TvDetail tv);

  Future<bool> getTvById(int id);

  Future<Either<Failure, List<Tv>>> getWatchlistTvs();
}
