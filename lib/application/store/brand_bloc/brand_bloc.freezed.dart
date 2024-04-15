// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBrandsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBrandsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBrandsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBrandsList value) getBrandsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBrandsList value)? getBrandsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBrandsList value)? getBrandsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandEventCopyWith<$Res> {
  factory $BrandEventCopyWith(
          BrandEvent value, $Res Function(BrandEvent) then) =
      _$BrandEventCopyWithImpl<$Res, BrandEvent>;
}

/// @nodoc
class _$BrandEventCopyWithImpl<$Res, $Val extends BrandEvent>
    implements $BrandEventCopyWith<$Res> {
  _$BrandEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBrandsListImplCopyWith<$Res> {
  factory _$$GetBrandsListImplCopyWith(
          _$GetBrandsListImpl value, $Res Function(_$GetBrandsListImpl) then) =
      __$$GetBrandsListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBrandsListImplCopyWithImpl<$Res>
    extends _$BrandEventCopyWithImpl<$Res, _$GetBrandsListImpl>
    implements _$$GetBrandsListImplCopyWith<$Res> {
  __$$GetBrandsListImplCopyWithImpl(
      _$GetBrandsListImpl _value, $Res Function(_$GetBrandsListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBrandsListImpl implements GetBrandsList {
  const _$GetBrandsListImpl();

  @override
  String toString() {
    return 'BrandEvent.getBrandsList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBrandsListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBrandsList,
  }) {
    return getBrandsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBrandsList,
  }) {
    return getBrandsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBrandsList,
    required TResult orElse(),
  }) {
    if (getBrandsList != null) {
      return getBrandsList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBrandsList value) getBrandsList,
  }) {
    return getBrandsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBrandsList value)? getBrandsList,
  }) {
    return getBrandsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBrandsList value)? getBrandsList,
    required TResult orElse(),
  }) {
    if (getBrandsList != null) {
      return getBrandsList(this);
    }
    return orElse();
  }
}

abstract class GetBrandsList implements BrandEvent {
  const factory GetBrandsList() = _$GetBrandsListImpl;
}

/// @nodoc
mixin _$BrandState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BrandModel>? get brands => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<BrandModel>>>
      get brandsSuccessFailureOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandStateCopyWith<BrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) then) =
      _$BrandStateCopyWithImpl<$Res, BrandState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<BrandModel>? brands,
      Option<Either<MainFailure, List<BrandModel>>>
          brandsSuccessFailureOption});
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res, $Val extends BrandState>
    implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = freezed,
    Object? brandsSuccessFailureOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: freezed == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>?,
      brandsSuccessFailureOption: null == brandsSuccessFailureOption
          ? _value.brandsSuccessFailureOption
          : brandsSuccessFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<BrandModel>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandStateImplCopyWith<$Res>
    implements $BrandStateCopyWith<$Res> {
  factory _$$BrandStateImplCopyWith(
          _$BrandStateImpl value, $Res Function(_$BrandStateImpl) then) =
      __$$BrandStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<BrandModel>? brands,
      Option<Either<MainFailure, List<BrandModel>>>
          brandsSuccessFailureOption});
}

/// @nodoc
class __$$BrandStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandStateImpl>
    implements _$$BrandStateImplCopyWith<$Res> {
  __$$BrandStateImplCopyWithImpl(
      _$BrandStateImpl _value, $Res Function(_$BrandStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = freezed,
    Object? brandsSuccessFailureOption = null,
  }) {
    return _then(_$BrandStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: freezed == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>?,
      brandsSuccessFailureOption: null == brandsSuccessFailureOption
          ? _value.brandsSuccessFailureOption
          : brandsSuccessFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<BrandModel>>>,
    ));
  }
}

/// @nodoc

class _$BrandStateImpl implements _BrandState {
  const _$BrandStateImpl(
      {required this.isLoading,
      final List<BrandModel>? brands,
      required this.brandsSuccessFailureOption})
      : _brands = brands;

  @override
  final bool isLoading;
  final List<BrandModel>? _brands;
  @override
  List<BrandModel>? get brands {
    final value = _brands;
    if (value == null) return null;
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<BrandModel>>>
      brandsSuccessFailureOption;

  @override
  String toString() {
    return 'BrandState(isLoading: $isLoading, brands: $brands, brandsSuccessFailureOption: $brandsSuccessFailureOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.brandsSuccessFailureOption,
                    brandsSuccessFailureOption) ||
                other.brandsSuccessFailureOption ==
                    brandsSuccessFailureOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_brands), brandsSuccessFailureOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandStateImplCopyWith<_$BrandStateImpl> get copyWith =>
      __$$BrandStateImplCopyWithImpl<_$BrandStateImpl>(this, _$identity);
}

abstract class _BrandState implements BrandState {
  const factory _BrandState(
      {required final bool isLoading,
      final List<BrandModel>? brands,
      required final Option<Either<MainFailure, List<BrandModel>>>
          brandsSuccessFailureOption}) = _$BrandStateImpl;

  @override
  bool get isLoading;
  @override
  List<BrandModel>? get brands;
  @override
  Option<Either<MainFailure, List<BrandModel>>> get brandsSuccessFailureOption;
  @override
  @JsonKey(ignore: true)
  _$$BrandStateImplCopyWith<_$BrandStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
