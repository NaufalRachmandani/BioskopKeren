import 'package:bioskop_keren/data/data_sources/db/database_helper.dart';
import 'package:bioskop_keren/data/data_sources/movie/local/movie_local_data_source.dart';
import 'package:bioskop_keren/data/data_sources/movie/remote/movie_remote_data_source.dart';
import 'package:bioskop_keren/data/data_sources/tv/local/tv_local_data_source.dart';
import 'package:bioskop_keren/data/data_sources/tv/remote/tv_remote_data_source.dart';
import 'package:bioskop_keren/data/repositories/movie_repository_impl.dart';
import 'package:bioskop_keren/data/repositories/tv_repository_impl.dart';
import 'package:bioskop_keren/domain/movie/repositories/movie_repository.dart';
import 'package:bioskop_keren/domain/movie/usecases/get_popular_movies.dart';
import 'package:bioskop_keren/domain/movie/usecases/get_watchlist_status.dart';
import 'package:bioskop_keren/domain/movie/usecases/remove_watchlist.dart';
import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_now_playing_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_popular_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_top_rated_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_tv_by_id.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_tv_detail.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_tv_recommendations.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_tv_season_detail.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_watchlist_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/insert_watchlist_tv.dart';
import 'package:bioskop_keren/domain/tv/usecases/remove_watchlist_tv.dart';
import 'package:bioskop_keren/domain/tv/usecases/search_tvs.dart';
import 'package:bioskop_keren/presentation/provider/movie_detail_notifier.dart';
import 'package:bioskop_keren/presentation/provider/movie_list_notifier.dart';
import 'package:bioskop_keren/presentation/provider/movie_search_notifier.dart';
import 'package:bioskop_keren/presentation/provider/now_playing_movies_notifier.dart';
import 'package:bioskop_keren/presentation/provider/now_playing_tv_notifier.dart';
import 'package:bioskop_keren/presentation/provider/popular_movies_notifier.dart';
import 'package:bioskop_keren/presentation/provider/popular_tv_notifier.dart';
import 'package:bioskop_keren/presentation/provider/top_rated_movies_notifier.dart';
import 'package:bioskop_keren/presentation/provider/top_rated_tv_notifier.dart';
import 'package:bioskop_keren/presentation/provider/tv_detail_notifier.dart';
import 'package:bioskop_keren/presentation/provider/tv_list_notifier.dart';
import 'package:bioskop_keren/presentation/provider/tv_search_notifier.dart';
import 'package:bioskop_keren/presentation/provider/watchlist_movie_notifier.dart';
import 'package:bioskop_keren/presentation/provider/watchlist_tv_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'domain/movie/usecases/get_movie_detail.dart';
import 'domain/movie/usecases/get_movie_recommendations.dart';
import 'domain/movie/usecases/get_now_playing_movies.dart';
import 'domain/movie/usecases/get_top_rated_movies.dart';
import 'domain/movie/usecases/get_watchlist_movies.dart';
import 'domain/movie/usecases/save_watchlist.dart';
import 'domain/movie/usecases/search_movies.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvListNotifier(
      getNowPlayingTvsUseCase: locator(),
      getPopularTvsUseCase: locator(),
      getTopRatedTvsUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => TvDetailNotifier(
      getTvDetailUseCase: locator(),
      getTvRecommendationsUseCase: locator(),
      getTvByIdUseCase: locator(),
      insertWatchlistTvUseCase: locator(),
      removeWatchlistTvUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSearchNotifier(
      searchTvs: locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingTvNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvNotifier(
      getTopRatedTvsUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvNotifier(
      getWatchlistTvUseCase: locator(),
    ),
  );

  // use case
  // movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // tv
  locator.registerLazySingleton(() => GetNowPlayingTvs(locator()));
  locator.registerLazySingleton(() => GetPopularTvs(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvs(locator()));
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => GetTvSeasonDetail(locator()));
  locator.registerLazySingleton(() => SearchTvs(locator()));
  locator.registerLazySingleton(() => GetTvById(locator()));
  locator.registerLazySingleton(() => InsertWatchlistTv(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTv(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvs(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
