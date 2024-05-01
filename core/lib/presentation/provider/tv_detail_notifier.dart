import 'package:core/domain/tv/entities/tv.dart';
import 'package:core/domain/tv/entities/tv_detail.dart';
import 'package:core/domain/tv/usecases/get_tv_by_id.dart';
import 'package:core/domain/tv/usecases/get_tv_detail.dart';
import 'package:core/domain/tv/usecases/get_tv_recommendations.dart';
import 'package:core/domain/tv/usecases/insert_watchlist_tv.dart';
import 'package:core/domain/tv/usecases/remove_watchlist_tv.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvDetail getTvDetailUseCase;
  final GetTvRecommendations getTvRecommendationsUseCase;
  final GetTvById getTvByIdUseCase;
  final InsertWatchlistTv insertWatchlistTvUseCase;
  final RemoveWatchlistTv removeWatchlistTvUseCase;

  TvDetailNotifier({
    required this.getTvDetailUseCase,
    required this.getTvRecommendationsUseCase,
    required this.getTvByIdUseCase,
    required this.insertWatchlistTvUseCase,
    required this.removeWatchlistTvUseCase,
  });

  late TvDetail _tvDetail;

  TvDetail get tvDetail => _tvDetail;

  RequestState _tvDetailState = RequestState.Empty;

  RequestState get tvDetailState => _tvDetailState;

  List<Tv> _tvRecommendations = [];

  List<Tv> get tvRecommendations => _tvRecommendations;

  RequestState _recommendationState = RequestState.Empty;

  RequestState get recommendationState => _recommendationState;

  String _message = '';

  String get message => _message;

  bool _isAddedtoWatchlist = false;

  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> getTvDetail(int id) async {
    _tvDetailState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvDetailUseCase.execute(id);
    final recommendationResult = await getTvRecommendationsUseCase.execute(id);
    detailResult.fold(
      (failure) {
        _tvDetailState = RequestState.Error;
        _message = failure.message ?? '';
        notifyListeners();
      },
      (data) {
        _recommendationState = RequestState.Loading;
        _tvDetail = data;
        notifyListeners();

        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message ?? '';
          },
          (recommendationData) {
            _recommendationState = RequestState.Loaded;
            _tvRecommendations = recommendationData;
          },
        );

        _tvDetailState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';

  String get watchlistMessage => _watchlistMessage;

  Future<void> insertWatchlistTv(TvDetail tvDetail) async {
    final result = await insertWatchlistTvUseCase.execute(tvDetail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message ?? '';
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await getTvById(tvDetail.id);
  }

  Future<void> removeWatchlistTv(TvDetail tvDetail) async {
    final result = await removeWatchlistTvUseCase.execute(tvDetail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message ?? '';
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await getTvById(tvDetail.id);
  }

  Future<void> getTvById(int id) async {
    final result = await getTvByIdUseCase.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
