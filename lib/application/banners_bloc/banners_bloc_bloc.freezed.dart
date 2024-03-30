// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banners_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BannersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBannersImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBannersImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBannersImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBannersImage value) getBannersImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBannersImage value)? getBannersImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBannersImage value)? getBannersImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersEventCopyWith<$Res> {
  factory $BannersEventCopyWith(
          BannersEvent value, $Res Function(BannersEvent) then) =
      _$BannersEventCopyWithImpl<$Res, BannersEvent>;
}

/// @nodoc
class _$BannersEventCopyWithImpl<$Res, $Val extends BannersEvent>
    implements $BannersEventCopyWith<$Res> {
  _$BannersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBannersImageImplCopyWith<$Res> {
  factory _$$GetBannersImageImplCopyWith(_$GetBannersImageImpl value,
          $Res Function(_$GetBannersImageImpl) then) =
      __$$GetBannersImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBannersImageImplCopyWithImpl<$Res>
    extends _$BannersEventCopyWithImpl<$Res, _$GetBannersImageImpl>
    implements _$$GetBannersImageImplCopyWith<$Res> {
  __$$GetBannersImageImplCopyWithImpl(
      _$GetBannersImageImpl _value, $Res Function(_$GetBannersImageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBannersImageImpl implements GetBannersImage {
  const _$GetBannersImageImpl();

  @override
  String toString() {
    return 'BannersEvent.getBannersImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBannersImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBannersImage,
  }) {
    return getBannersImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBannersImage,
  }) {
    return getBannersImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBannersImage,
    required TResult orElse(),
  }) {
    if (getBannersImage != null) {
      return getBannersImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBannersImage value) getBannersImage,
  }) {
    return getBannersImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBannersImage value)? getBannersImage,
  }) {
    return getBannersImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBannersImage value)? getBannersImage,
    required TResult orElse(),
  }) {
    if (getBannersImage != null) {
      return getBannersImage(this);
    }
    return orElse();
  }
}

abstract class GetBannersImage implements BannersEvent {
  const factory GetBannersImage() = _$GetBannersImageImpl;
}

/// @nodoc
mixin _$BannersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Banners>? get banners => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Banners>>> get bannersSuccessFailureOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannersStateCopyWith<BannersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersStateCopyWith<$Res> {
  factory $BannersStateCopyWith(
          BannersState value, $Res Function(BannersState) then) =
      _$BannersStateCopyWithImpl<$Res, BannersState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Banners>? banners,
      Option<Either<MainFailure, List<Banners>>> bannersSuccessFailureOption});
}

/// @nodoc
class _$BannersStateCopyWithImpl<$Res, $Val extends BannersState>
    implements $BannersStateCopyWith<$Res> {
  _$BannersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? banners = freezed,
    Object? bannersSuccessFailureOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: freezed == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<Banners>?,
      bannersSuccessFailureOption: null == bannersSuccessFailureOption
          ? _value.bannersSuccessFailureOption
          : bannersSuccessFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Banners>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannersStateImplCopyWith<$Res>
    implements $BannersStateCopyWith<$Res> {
  factory _$$BannersStateImplCopyWith(
          _$BannersStateImpl value, $Res Function(_$BannersStateImpl) then) =
      __$$BannersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Banners>? banners,
      Option<Either<MainFailure, List<Banners>>> bannersSuccessFailureOption});
}

/// @nodoc
class __$$BannersStateImplCopyWithImpl<$Res>
    extends _$BannersStateCopyWithImpl<$Res, _$BannersStateImpl>
    implements _$$BannersStateImplCopyWith<$Res> {
  __$$BannersStateImplCopyWithImpl(
      _$BannersStateImpl _value, $Res Function(_$BannersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? banners = freezed,
    Object? bannersSuccessFailureOption = null,
  }) {
    return _then(_$BannersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: freezed == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<Banners>?,
      bannersSuccessFailureOption: null == bannersSuccessFailureOption
          ? _value.bannersSuccessFailureOption
          : bannersSuccessFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Banners>>>,
    ));
  }
}

/// @nodoc

class _$BannersStateImpl implements _BannersState {
  const _$BannersStateImpl(
      {required this.isLoading,
      final List<Banners>? banners,
      required this.bannersSuccessFailureOption})
      : _banners = banners;

  @override
  final bool isLoading;
  final List<Banners>? _banners;
  @override
  List<Banners>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<Banners>>> bannersSuccessFailureOption;

  @override
  String toString() {
    return 'BannersState(isLoading: $isLoading, banners: $banners, bannersSuccessFailureOption: $bannersSuccessFailureOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            (identical(other.bannersSuccessFailureOption,
                    bannersSuccessFailureOption) ||
                other.bannersSuccessFailureOption ==
                    bannersSuccessFailureOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_banners),
      bannersSuccessFailureOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannersStateImplCopyWith<_$BannersStateImpl> get copyWith =>
      __$$BannersStateImplCopyWithImpl<_$BannersStateImpl>(this, _$identity);
}

abstract class _BannersState implements BannersState {
  const factory _BannersState(
      {required final bool isLoading,
      final List<Banners>? banners,
      required final Option<Either<MainFailure, List<Banners>>>
          bannersSuccessFailureOption}) = _$BannersStateImpl;

  @override
  bool get isLoading;
  @override
  List<Banners>? get banners;
  @override
  Option<Either<MainFailure, List<Banners>>> get bannersSuccessFailureOption;
  @override
  @JsonKey(ignore: true)
  _$$BannersStateImplCopyWith<_$BannersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
