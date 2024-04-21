import 'package:bioskop_keren/data/data_sources/movie/remote/model/genre_model.dart';
import 'package:bioskop_keren/domain/movie/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const genreModel = GenreModel(
    id: 12,
    name: "Adventure",
  );

  const genre = Genre(
    id: 12,
    name: "Adventure",
  );

  const movieJson = {"id": 12, "name": "Adventure"};

  test("should success map to entity", () async {
    final result = genreModel.toEntity();
    expect(result, genre);
  });

  test('should equal json response map to model', () async {
    final result = GenreModel.fromJson(movieJson);
    expect(result, genreModel);
  });
}
