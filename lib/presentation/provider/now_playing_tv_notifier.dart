import 'package:bioskop_keren/common/state_enum.dart';
import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_now_playing_tvs.dart';
import 'package:flutter/foundation.dart';

class NowPlayingTvNotifier extends ChangeNotifier {
  final GetNowPlayingTvs getNowPlayingTvUseCase;

  NowPlayingTvNotifier(this.getNowPlayingTvUseCase);

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<Tv> _tvs = [];

  List<Tv> get tvs => _tvs;

  String _message = '';

  String get message => _message;

  Future<void> getNowPlayingTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvUseCase.execute();

    result.fold(
      (failure) {
        _message = failure.message ?? '';
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _tvs = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
