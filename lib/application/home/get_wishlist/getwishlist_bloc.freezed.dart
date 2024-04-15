// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getwishlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetwishlistEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getWishlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getWishlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getWishlist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWishlist value) getWishlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWishlist value)? getWishlist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWishlist value)? getWishlist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetwishlistEventCopyWith<GetwishlistEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetwishlistEventCopyWith<$Res> {
  factory $GetwishlistEventCopyWith(
          GetwishlistEvent value, $Res Function(GetwishlistEvent) then) =
      _$GetwishlistEventCopyWithImpl<$Res, GetwishlistEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$GetwishlistEventCopyWithImpl<$Res, $Val extends GetwishlistEvent>
    implements $GetwishlistEventCopyWith<$Res> {
  _$GetwishlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetWishlistImplCopyWith<$Res>
    implements $GetwishlistEventCopyWith<$Res> {
  factory _$$GetWishlistImplCopyWith(
          _$GetWishlistImpl value, $Res Function(_$GetWishlistImpl) then) =
      __$$GetWishlistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetWishlistImplCopyWithImpl<$Res>
    extends _$GetwishlistEventCopyWithImpl<$Res, _$GetWishlistImpl>
    implements _$$GetWishlistImplCopyWith<$Res> {
  __$$GetWishlistImplCopyWithImpl(
      _$GetWishlistImpl _value, $Res Function(_$GetWishlistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetWishlistImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWishlistImpl implements GetWishlist {
  const _$GetWishlistImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'GetwishlistEvent.getWishlist(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWishlistImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWishlistImplCopyWith<_$GetWishlistImpl> get copyWith =>
      __$$GetWishlistImplCopyWithImpl<_$GetWishlistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getWishlist,
  }) {
    return getWishlist(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getWishlist,
  }) {
    return getWishlist?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getWishlist,
    required TResult orElse(),
  }) {
    if (getWishlist != null) {
      return getWishlist(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWishlist value) getWishlist,
  }) {
    return getWishlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWishlist value)? getWishlist,
  }) {
    return getWishlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWishlist value)? getWishlist,
    required TResult orElse(),
  }) {
    if (getWishlist != null) {
      return getWishlist(this);
    }
    return orElse();
  }
}

abstract class GetWishlist implements GetwishlistEvent {
  const factory GetWishlist(final String userId) = _$GetWishlistImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$GetWishlistImplCopyWith<_$GetWishlistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetwishlistState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String>? get wishList => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<String>>> get wishlistSuccessorFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetwishlistStateCopyWith<GetwishlistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetwishlistStateCopyWith<$Res> {
  factory $GetwishlistStateCopyWith(
          GetwishlistState value, $Res Function(GetwishlistState) then) =
      _$GetwishlistStateCopyWithImpl<$Res, GetwishlistState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<String>? wishList,
      Option<Either<MainFailure, List<String>>> wishlistSuccessorFailure});
}

/// @nodoc
class _$GetwishlistStateCopyWithImpl<$Res, $Val extends GetwishlistState>
    implements $GetwishlistStateCopyWith<$Res> {
  _$GetwishlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? wishList = freezed,
    Object? wishlistSuccessorFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wishList: freezed == wishList
          ? _value.wishList
          : wishList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      wishlistSuccessorFailure: null == wishlistSuccessorFailure
          ? _value.wishlistSuccessorFailure
          : wishlistSuccessorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<String>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetwishlistStateImplCopyWith<$Res>
    implements $GetwishlistStateCopyWith<$Res> {
  factory _$$GetwishlistStateImplCopyWith(_$GetwishlistStateImpl value,
          $Res Function(_$GetwishlistStateImpl) then) =
      __$$GetwishlistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<String>? wishList,
      Option<Either<MainFailure, List<String>>> wishlistSuccessorFailure});
}

/// @nodoc
class __$$GetwishlistStateImplCopyWithImpl<$Res>
    extends _$GetwishlistStateCopyWithImpl<$Res, _$GetwishlistStateImpl>
    implements _$$GetwishlistStateImplCopyWith<$Res> {
  __$$GetwishlistStateImplCopyWithImpl(_$GetwishlistStateImpl _value,
      $Res Function(_$GetwishlistStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? wishList = freezed,
    Object? wishlistSuccessorFailure = null,
  }) {
    return _then(_$GetwishlistStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wishList: freezed == wishList
          ? _value._wishList
          : wishList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      wishlistSuccessorFailure: null == wishlistSuccessorFailure
          ? _value.wishlistSuccessorFailure
          : wishlistSuccessorFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<String>>>,
    ));
  }
}

/// @nodoc

class _$GetwishlistStateImpl implements _GetwishlistState {
  const _$GetwishlistStateImpl(
      {required this.isLoading,
      final List<String>? wishList,
      required this.wishlistSuccessorFailure})
      : _wishList = wishList;

  @override
  final bool isLoading;
  final List<String>? _wishList;
  @override
  List<String>? get wishList {
    final value = _wishList;
    if (value == null) return null;
    if (_wishList is EqualUnmodifiableListView) return _wishList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<String>>> wishlistSuccessorFailure;

  @override
  String toString() {
    return 'GetwishlistState(isLoading: $isLoading, wishList: $wishList, wishlistSuccessorFailure: $wishlistSuccessorFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetwishlistStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._wishList, _wishList) &&
            (identical(
                    other.wishlistSuccessorFailure, wishlistSuccessorFailure) ||
                other.wishlistSuccessorFailure == wishlistSuccessorFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_wishList), wishlistSuccessorFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetwishlistStateImplCopyWith<_$GetwishlistStateImpl> get copyWith =>
      __$$GetwishlistStateImplCopyWithImpl<_$GetwishlistStateImpl>(
          this, _$identity);
}

abstract class _GetwishlistState implements GetwishlistState {
  const factory _GetwishlistState(
      {required final bool isLoading,
      final List<String>? wishList,
      required final Option<Either<MainFailure, List<String>>>
          wishlistSuccessorFailure}) = _$GetwishlistStateImpl;

  @override
  bool get isLoading;
  @override
  List<String>? get wishList;
  @override
  Option<Either<MainFailure, List<String>>> get wishlistSuccessorFailure;
  @override
  @JsonKey(ignore: true)
  _$$GetwishlistStateImplCopyWith<_$GetwishlistStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
