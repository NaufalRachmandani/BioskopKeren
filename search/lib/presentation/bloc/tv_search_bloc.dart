import 'package:core/domain/tv/entities/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/tv/usecases/search_tvs.dart';

part 'tv_search_event.dart';
part 'tv_search_state.dart';

class TvSearchBloc extends Bloc<TvSearchEvent, TvSearchState> {
  final SearchTvs _searchTvs;

  TvSearchBloc(this._searchTvs) : super(TvSearchEmptyState()) {
    on<TvOnQueryChangedEvent>((event, emit) async {
      final query = event.query;

      emit(TvSearchLoadingState());

      final result = await _searchTvs.execute(query);
      result.fold(
        (failure) {
          emit(TvSearchErrorState(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(TvSearchEmptyState());
          } else {
            emit(TvSearchHasDataState(data));
          }
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
