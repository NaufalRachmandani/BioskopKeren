import 'package:bioskop_keren/data/data_sources/db/database_helper.dart';
import 'package:bioskop_keren/data/data_sources/movie/local/movie_local_data_source.dart';
import 'package:bioskop_keren/data/data_sources/movie/remote/movie_remote_data_source.dart';
import 'package:bioskop_keren/domain/movie/repositories/movie_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
