// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProductDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProductDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProductDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetails value) loadProductDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetails value)? loadProductDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetails value)? loadProductDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
          ProductsEvent value, $Res Function(ProductsEvent) then) =
      _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadProductDetailsImplCopyWith<$Res> {
  factory _$$LoadProductDetailsImplCopyWith(_$LoadProductDetailsImpl value,
          $Res Function(_$LoadProductDetailsImpl) then) =
      __$$LoadProductDetailsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadProductDetailsImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$LoadProductDetailsImpl>
    implements _$$LoadProductDetailsImplCopyWith<$Res> {
  __$$LoadProductDetailsImplCopyWithImpl(_$LoadProductDetailsImpl _value,
      $Res Function(_$LoadProductDetailsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadProductDetailsImpl implements LoadProductDetails {
  const _$LoadProductDetailsImpl();

  @override
  String toString() {
    return 'ProductsEvent.loadProductDetails()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadProductDetailsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProductDetails,
  }) {
    return loadProductDetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProductDetails,
  }) {
    return loadProductDetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProductDetails,
    required TResult orElse(),
  }) {
    if (loadProductDetails != null) {
      return loadProductDetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetails value) loadProductDetails,
  }) {
    return loadProductDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetails value)? loadProductDetails,
  }) {
    return loadProductDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetails value)? loadProductDetails,
    required TResult orElse(),
  }) {
    if (loadProductDetails != null) {
      return loadProductDetails(this);
    }
    return orElse();
  }
}

abstract class LoadProductDetails implements ProductsEvent {
  const factory LoadProductDetails() = _$LoadProductDetailsImpl;
}

/// @nodoc
mixin _$ProductsState {
  List<Products> get productsList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call({List<Products> productsList, bool isLoading, bool hasError});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      productsList: null == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Products> productsList, bool isLoading, bool hasError});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$InitialImpl(
      productsList: null == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<Products> productsList,
      required this.isLoading,
      required this.hasError})
      : _productsList = productsList;

  final List<Products> _productsList;
  @override
  List<Products> get productsList {
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'ProductsState(productsList: $productsList, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productsList), isLoading, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ProductsState {
  const factory _Initial(
      {required final List<Products> productsList,
      required final bool isLoading,
      required final bool hasError}) = _$InitialImpl;

  @override
  List<Products> get productsList;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
