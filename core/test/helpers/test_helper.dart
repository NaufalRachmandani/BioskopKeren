import 'package:core/data/data_sources/db/database_helper.dart';
import 'package:core/data/data_sources/movie/local/movie_local_data_source.dart';
import 'package:core/data/data_sources/movie/remote/movie_remote_data_source.dart';
import 'package:core/data/data_sources/tv/local/tv_local_data_source.dart';
import 'package:core/data/data_sources/tv/remote/tv_remote_data_source.dart';
import 'package:core/domain/movie/repositories/movie_repository.dart';
import 'package:core/domain/tv/repositories/tv_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  TvRepository,
  MovieRemoteDataSource,
  TvRemoteDataSource,
  MovieLocalDataSource,
  TvLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
