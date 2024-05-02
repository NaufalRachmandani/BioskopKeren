import 'package:core/data/data_sources/movie/local/model/movie_table.dart';
import 'package:core/data/data_sources/tv/local/model/tv_table.dart';
import 'package:core/data/data_sources/tv/remote/model/episode_model.dart';
import 'package:core/data/data_sources/tv/remote/model/genre_model.dart'
    as GenreModelTV;
import 'package:core/data/data_sources/tv/remote/model/season_detail_model.dart';
import 'package:core/data/data_sources/tv/remote/model/season_model.dart';
import 'package:core/data/data_sources/tv/remote/model/tv_detail_model.dart';
import 'package:core/data/data_sources/tv/remote/model/tv_model.dart';
import 'package:core/domain/movie/entities/genre.dart';
import 'package:core/domain/movie/entities/movie.dart';
import 'package:core/domain/movie/entities/movie_detail.dart';
import 'package:core/domain/tv/entities/genre.dart' as GenreTV;
import 'package:core/domain/tv/entities/season.dart';
import 'package:core/domain/tv/entities/tv.dart';
import 'package:core/domain/tv/entities/tv_detail.dart';

// MOVIE Section

const testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

const testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

// TV Section

const testTv = Tv(
  posterPath: "posterPath",
  popularity: 1,
  id: 1,
  backdropPath: "backdropPath",
  voteAverage: 1,
  overview: "overview",
  firstAirDate: "firstAirDate",
  originCountry: ["id"],
  genreIds: [1],
  originalLanguage: "originalLanguage",
  voteCount: 1,
  name: "name",
  originalName: "originalName",
);

const testTvModel = TvModel(
  posterPath: 'posterPath',
  popularity: 1,
  id: 1,
  backdropPath: 'backdropPath',
  voteAverage: 1,
  overview: 'overview',
  firstAirDate: "firstAirDate",
  originCountry: ["id"],
  genreIds: [1],
  originalLanguage: "originalLanguage",
  voteCount: 1,
  name: "name",
  originalName: "originalName",
);

final testTvList = [testTv];
final testTvModelList = [testTvModel];

const tvSeason = Season(
  airDate: "airDate",
  episodeCount: 1,
  id: 1,
  name: "name",
  overview: "overview",
  posterPath: "posterPath",
  seasonNumber: 1,
);

const tvSeasonModel = SeasonModel(
  airDate: "airDate",
  episodeCount: 1,
  id: 1,
  name: "name",
  overview: "overview",
  posterPath: "posterPath",
  seasonNumber: 1,
);

const testTvDetailResponse = TvDetailResponse(
  backdropPath: "backdropPath",
  firstAirDate: "firstAirDate",
  genres: [GenreModelTV.GenreModel(id: 1, name: 'Action')],
  homepage: "homepage",
  id: 1,
  inProduction: true,
  languages: ["languages"],
  lastAirDate: "lastAirDate",
  name: "name",
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originCountry: ["originCountry"],
  originalLanguage: "originalLanguage",
  originalName: "originalName",
  overview: "overview",
  popularity: 1,
  posterPath: "posterPath",
  seasons: [tvSeasonModel],
  status: "status",
  tagline: "tagline",
  type: "type",
  voteAverage: 1,
  voteCount: 1,
);

const testTvDetail = TvDetail(
  backdropPath: "backdropPath",
  firstAirDate: "firstAirDate",
  genres: [GenreTV.Genre(id: 1, name: 'Action')],
  id: 1,
  lastAirDate: "lastAirDate",
  name: "name",
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  overview: "overview",
  posterPath: "posterPath",
  seasons: [tvSeason],
  status: "status",
  tagline: "tagline",
  type: "type",
  voteAverage: 1,
  voteCount: 1,
);

const testWatchlistTv = Tv.watchlist(
  id: 1,
  name: "name",
  posterPath: 'posterPath',
  overview: 'overview',
);

const testTvTable = TvTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testTvWatchlist = Tv(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
  popularity: null,
  backdropPath: null,
  voteAverage: null,
  firstAirDate: null,
  originCountry: null,
  genreIds: null,
  originalLanguage: null,
  voteCount: null,
  originalName: null,
);

final testTvMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};

const testEpisodeModel = EpisodeModel(
  airDate: "airDate",
  episodeNumber: 1,
  id: 1,
  name: "name",
  overview: "overview",
  productionCode: "productionCode",
  seasonNumber: 1,
  stillPath: "stillPath",
  voteAverage: 1,
  voteCount: 1,
);

const testSeasonDetailResponse = SeasonDetailResponse(
  id: 1,
  airDate: "airDate",
  episodes: [testEpisodeModel],
  name: "name",
  overview: "overview",
  posterPath: "posterPath",
  seasonNumber: 1,
);
