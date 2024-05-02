part of 'tv_search_bloc.dart';

sealed class TvSearchState extends Equatable {
  const TvSearchState();

  @override
  List<Object> get props => [];
}

class TvSearchEmptyState extends TvSearchState {}

class TvSearchLoadingState extends TvSearchState {}

class TvSearchErrorState extends TvSearchState {
  final String message;

  const TvSearchErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class TvSearchHasDataState extends TvSearchState {
  final List<Tv> result;

  const TvSearchHasDataState(this.result);

  @override
  List<Object> get props => [result];
}
