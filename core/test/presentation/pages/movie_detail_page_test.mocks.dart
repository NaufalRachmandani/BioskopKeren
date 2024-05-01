// Mocks generated by Mockito 5.4.4 from annotations
// in bioskop_keren/test/presentation/pages/movie_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;
import 'dart:ui' as _i13;

import 'package:core/domain/movie/entities/movie.dart' as _i10;
import 'package:core/domain/movie/entities/movie_detail.dart' as _i7;
import 'package:core/domain/movie/usecases/get_movie_detail.dart'
    as _i2;
import 'package:core/domain/movie/usecases/get_movie_recommendations.dart'
    as _i3;
import 'package:core/domain/movie/usecases/get_watchlist_status.dart'
    as _i4;
import 'package:core/domain/movie/usecases/remove_watchlist.dart'
    as _i6;
import 'package:core/domain/movie/usecases/save_watchlist.dart' as _i5;
import 'package:core/presentation/provider/movie_detail_notifier.dart'
    as _i8;
import 'package:core/utils/state_enum.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetMovieDetail_0 extends _i1.SmartFake
    implements _i2.GetMovieDetail {
  _FakeGetMovieDetail_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetMovieRecommendations_1 extends _i1.SmartFake
    implements _i3.GetMovieRecommendations {
  _FakeGetMovieRecommendations_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchListStatus_2 extends _i1.SmartFake
    implements _i4.GetWatchListStatus {
  _FakeGetWatchListStatus_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveWatchlist_3 extends _i1.SmartFake implements _i5.SaveWatchlist {
  _FakeSaveWatchlist_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveWatchlist_4 extends _i1.SmartFake
    implements _i6.RemoveWatchlist {
  _FakeRemoveWatchlist_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetail_5 extends _i1.SmartFake implements _i7.MovieDetail {
  _FakeMovieDetail_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDetailNotifier extends _i1.Mock
    implements _i8.MovieDetailNotifier {
  MockMovieDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMovieDetail get getMovieDetail => (super.noSuchMethod(
        Invocation.getter(#getMovieDetail),
        returnValue: _FakeGetMovieDetail_0(
          this,
          Invocation.getter(#getMovieDetail),
        ),
      ) as _i2.GetMovieDetail);

  @override
  _i3.GetMovieRecommendations get getMovieRecommendations =>
      (super.noSuchMethod(
        Invocation.getter(#getMovieRecommendations),
        returnValue: _FakeGetMovieRecommendations_1(
          this,
          Invocation.getter(#getMovieRecommendations),
        ),
      ) as _i3.GetMovieRecommendations);

  @override
  _i4.GetWatchListStatus get getWatchListStatus => (super.noSuchMethod(
        Invocation.getter(#getWatchListStatus),
        returnValue: _FakeGetWatchListStatus_2(
          this,
          Invocation.getter(#getWatchListStatus),
        ),
      ) as _i4.GetWatchListStatus);

  @override
  _i5.SaveWatchlist get saveWatchlist => (super.noSuchMethod(
        Invocation.getter(#saveWatchlist),
        returnValue: _FakeSaveWatchlist_3(
          this,
          Invocation.getter(#saveWatchlist),
        ),
      ) as _i5.SaveWatchlist);

  @override
  _i6.RemoveWatchlist get removeWatchlist => (super.noSuchMethod(
        Invocation.getter(#removeWatchlist),
        returnValue: _FakeRemoveWatchlist_4(
          this,
          Invocation.getter(#removeWatchlist),
        ),
      ) as _i6.RemoveWatchlist);

  @override
  _i7.MovieDetail get movie => (super.noSuchMethod(
        Invocation.getter(#movie),
        returnValue: _FakeMovieDetail_5(
          this,
          Invocation.getter(#movie),
        ),
      ) as _i7.MovieDetail);

  @override
  _i9.RequestState get movieState => (super.noSuchMethod(
        Invocation.getter(#movieState),
        returnValue: _i9.RequestState.Empty,
      ) as _i9.RequestState);

  @override
  List<_i10.Movie> get movieRecommendations => (super.noSuchMethod(
        Invocation.getter(#movieRecommendations),
        returnValue: <_i10.Movie>[],
      ) as List<_i10.Movie>);

  @override
  _i9.RequestState get recommendationState => (super.noSuchMethod(
        Invocation.getter(#recommendationState),
        returnValue: _i9.RequestState.Empty,
      ) as _i9.RequestState);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get isAddedToWatchlist => (super.noSuchMethod(
        Invocation.getter(#isAddedToWatchlist),
        returnValue: false,
      ) as bool);

  @override
  String get watchlistMessage => (super.noSuchMethod(
        Invocation.getter(#watchlistMessage),
        returnValue: _i11.dummyValue<String>(
          this,
          Invocation.getter(#watchlistMessage),
        ),
      ) as String);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i12.Future<void> fetchMovieDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  _i12.Future<void> addWatchlist(_i7.MovieDetail? movie) => (super.noSuchMethod(
        Invocation.method(
          #addWatchlist,
          [movie],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  _i12.Future<void> removeFromWatchlist(_i7.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromWatchlist,
          [movie],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  _i12.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [id],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  void addListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}