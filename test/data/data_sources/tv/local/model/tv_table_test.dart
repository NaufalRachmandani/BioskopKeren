import 'package:bioskop_keren/data/data_sources/tv/local/model/tv_table.dart';
import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tvTable = TvTable(
    id: 601796,
    name: "Dark",
    posterPath: "/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg",
    overview:
        "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal",
  );

  const tvWatchlist = Tv.watchlist(
    id: 601796,
    name: "Dark",
    posterPath: '/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg',
    overview:
        "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal",
  );

  const tvJson = {
    'id': 601796,
    'name': 'Dark',
    'posterPath': '/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg',
    'overview':
        "Gurus in the late Goryeo dynasty try to obtain a fabled, holy sword, and humans in 2022 hunt down an alien prisoner that is locked in a human's body. The two parties cross paths when a time-traveling portal",
  };

  test("table should success map to entity", () async {
    final result = tvTable.toEntity();
    expect(result, tvWatchlist);
  });

  test('should equal json response map to table class', () async {
    final result = TvTable.fromMap(tvJson);
    expect(result, tvTable);
  });
}
