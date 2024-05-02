part of 'tv_search_bloc.dart';

sealed class TvSearchEvent extends Equatable {
  const TvSearchEvent();

  @override
  List<Object> get props => [];
}

class TvOnQueryChangedEvent extends TvSearchEvent {
  final String query;

  const TvOnQueryChangedEvent(this.query);

  @override
  List<Object> get props => [query];
}
