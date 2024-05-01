import 'package:core/data/data_sources/movie/remote/model/genre_model.dart';
import 'package:core/data/data_sources/movie/remote/model/movie_detail_model.dart';
import 'package:core/domain/movie/entities/genre.dart';
import 'package:core/domain/movie/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const movieDetailResponse = MovieDetailResponse(
    adult: true,
    backdropPath: "backdropPath",
    budget: 1,
    genres: [GenreModel(id: 1, name: "name")],
    homepage: "homepage",
    id: 1,
    imdbId: "imdbId",
    originalLanguage: "originalLanguage",
    originalTitle: "originalTitle",
    overview: "overview",
    popularity: 1,
    posterPath: "posterPath",
    releaseDate: "releaseDate",
    revenue: 1,
    runtime: 1,
    status: "status",
    tagline: "tagline",
    title: "title",
    video: true,
    voteAverage: 1,
    voteCount: 1,
  );

  const movieDetail = MovieDetail(
    adult: true,
    backdropPath: "backdropPath",
    genres: [Genre(id: 1, name: "name")],
    id: 1,
    originalTitle: "originalTitle",
    overview: "overview",
    posterPath: "posterPath",
    releaseDate: "releaseDate",
    runtime: 1,
    title: "title",
    voteAverage: 1,
    voteCount: 1,
  );

  const movieDetailJson = {
    "adult": true,
    "backdrop_path": "backdropPath",
    "budget": 1,
    "genres": [
      {
        'id': 1,
        'name': 'name',
      }
    ],
    "homepage": "homepage",
    "id": 1,
    "imdb_id": "imdbId",
    "original_language": "originalLanguage",
    "original_title": "originalTitle",
    "overview": "overview",
    "popularity": 1,
    "poster_path": "posterPath",
    "release_date": "releaseDate",
    "revenue": 1,
    "runtime": 1,
    "status": "status",
    "tagline": "tagline",
    "title": "title",
    "video": true,
    "vote_average": 1,
    "vote_count": 1,
  };

  test("should success map to entity", () async {
    final result = movieDetailResponse.toEntity();
    expect(result, movieDetail);
  });

  test('should equal json response map to model', () async {
    final result = MovieDetailResponse.fromJson(movieDetailJson);
    expect(result, movieDetailResponse);
  });
}
