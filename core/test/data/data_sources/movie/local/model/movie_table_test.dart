import 'package:core/data/data_sources/movie/local/model/movie_table.dart';
import 'package:core/domain/movie/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const movieTable = MovieTable(
    id: 601796,
    title: "Alienoid",
    posterPath: "/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg",
    overview:
        "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal",
  );

  const movieWatchlist = Movie.watchlist(
    id: 601796,
    title: 'Alienoid',
    posterPath: '/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg',
    overview:
        "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal",
  );

  const movieJson = {
    'id': 601796,
    'title': 'Alienoid',
    'posterPath': '/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg',
    'overview':
        "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal",
  };

  test("table should success map to entity", () async {
    final result = movieTable.toEntity();
    expect(result, movieWatchlist);
  });

  test('should equal json response map to table class', () async {
    final result = MovieTable.fromMap(movieJson);
    expect(result, movieTable);
  });
}
