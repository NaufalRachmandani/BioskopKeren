// Mocks generated by Mockito 5.4.4 from annotations
// in bioskop_keren/test/presentation/provider/tv_detail_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:bioskop_keren/domain/tv/entities/tv.dart' as _i9;
import 'package:bioskop_keren/domain/tv/entities/tv_detail.dart' as _i7;
import 'package:bioskop_keren/domain/tv/repositories/tv_repository.dart' as _i2;
import 'package:bioskop_keren/domain/tv/usecases/get_tv_by_id.dart' as _i10;
import 'package:bioskop_keren/domain/tv/usecases/get_tv_detail.dart' as _i4;
import 'package:bioskop_keren/domain/tv/usecases/get_tv_recommendations.dart'
    as _i8;
import 'package:bioskop_keren/domain/tv/usecases/insert_watchlist_tv.dart'
    as _i11;
import 'package:bioskop_keren/domain/tv/usecases/remove_watchlist_tv.dart'
    as _i12;
import 'package:core/utils/failure.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeTvRepository_0 extends _i1.SmartFake implements _i2.TvRepository {
  _FakeTvRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetTvDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvDetail extends _i1.Mock implements _i4.GetTvDetail {
  MockGetTvDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.TvDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.TvDetail>>.value(
            _FakeEither_1<_i6.Failure, _i7.TvDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.TvDetail>>);
}

/// A class which mocks [GetTvRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvRecommendations extends _i1.Mock
    implements _i8.GetTvRecommendations {
  MockGetTvRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i9.Tv>>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i6.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetTvById].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvById extends _i1.Mock implements _i10.GetTvById {
  MockGetTvById() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i5.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [InsertWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockInsertWatchlistTv extends _i1.Mock implements _i11.InsertWatchlistTv {
  MockInsertWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTv extends _i1.Mock implements _i12.RemoveWatchlistTv {
  MockRemoveWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
