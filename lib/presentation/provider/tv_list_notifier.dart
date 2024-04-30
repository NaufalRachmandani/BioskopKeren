import 'package:bioskop_keren/domain/tv/entities/tv.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_now_playing_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_popular_tvs.dart';
import 'package:bioskop_keren/domain/tv/usecases/get_top_rated_tvs.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _nowPlayingTvs = <Tv>[];

  List<Tv> get nowPlayingTvs => _nowPlayingTvs;

  RequestState _nowPlayingState = RequestState.Empty;

  RequestState get nowPlayingState => _nowPlayingState;

  var _popularTvs = <Tv>[];

  List<Tv> get popularTvs => _popularTvs;

  RequestState _popularTvsState = RequestState.Empty;

  RequestState get popularTvsState => _popularTvsState;

  var _topRatedTvs = <Tv>[];

  List<Tv> get topRatedTvs => _topRatedTvs;

  RequestState _topRatedTvsState = RequestState.Empty;

  RequestState get topRatedTvsState => _topRatedTvsState;

  String _message = '';

  String get message => _message;

  TvListNotifier({
    required this.getNowPlayingTvsUseCase,
    required this.getPopularTvsUseCase,
    required this.getTopRatedTvsUseCase,
  });

  final GetNowPlayingTvs getNowPlayingTvsUseCase;
  final GetPopularTvs getPopularTvsUseCase;
  final GetTopRatedTvs getTopRatedTvsUseCase;

  Future<void> getNowPlayingTvs() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvsUseCase.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message ?? '';
        notifyListeners();
      },
      (response) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingTvs = response;
        notifyListeners();
      },
    );
  }

  Future<void> getPopularTvs() async {
    _popularTvsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvsUseCase.execute();
    result.fold(
      (failure) {
        _popularTvsState = RequestState.Error;
        _message = failure.message ?? '';
        notifyListeners();
      },
      (response) {
        _popularTvsState = RequestState.Loaded;
        _popularTvs = response;
        notifyListeners();
      },
    );
  }

  Future<void> getTopRatedTvs() async {
    _topRatedTvsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvsUseCase.execute();
    result.fold(
      (failure) {
        _topRatedTvsState = RequestState.Error;
        _message = failure.message ?? '';
        notifyListeners();
      },
      (response) {
        _topRatedTvsState = RequestState.Loaded;
        _topRatedTvs = response;
        notifyListeners();
      },
    );
  }
}
