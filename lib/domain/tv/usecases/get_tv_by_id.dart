import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart';

class GetTvById {
  final TvRepository repository;

  GetTvById(this.repository);

  Future<bool> execute(int id) {
    return repository.getTvById(id);
  }
}
