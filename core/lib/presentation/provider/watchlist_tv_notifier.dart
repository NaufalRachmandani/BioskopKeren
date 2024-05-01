import 'package:core/domain/tv/entities/tv.dart';
import 'package:core/domain/tv/usecases/get_watchlist_tvs.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/foundation.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTv = <Tv>[];

  List<Tv> get watchlistTv => _watchlistTv;

  var _watchlistState = RequestState.Empty;

  RequestState get watchlistState => _watchlistState;

  String _message = '';

  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTvUseCase});

  final GetWatchlistTvs getWatchlistTvUseCase;

  Future<void> getWatchlistTv() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvUseCase.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message ?? '';
        notifyListeners();
      },
      (data) {
        _watchlistState = RequestState.Loaded;
        _watchlistTv = data;
        notifyListeners();
      },
    );
  }
}
