// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetCartEvent {
  String get userId => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, double totalPrice) getCartList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, double totalPrice)? getCartList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, double totalPrice)? getCartList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCartList value) getCartList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCartList value)? getCartList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCartList value)? getCartList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCartEventCopyWith<GetCartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCartEventCopyWith<$Res> {
  factory $GetCartEventCopyWith(
          GetCartEvent value, $Res Function(GetCartEvent) then) =
      _$GetCartEventCopyWithImpl<$Res, GetCartEvent>;
  @useResult
  $Res call({String userId, double totalPrice});
}

/// @nodoc
class _$GetCartEventCopyWithImpl<$Res, $Val extends GetCartEvent>
    implements $GetCartEventCopyWith<$Res> {
  _$GetCartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCartListImplCopyWith<$Res>
    implements $GetCartEventCopyWith<$Res> {
  factory _$$GetCartListImplCopyWith(
          _$GetCartListImpl value, $Res Function(_$GetCartListImpl) then) =
      __$$GetCartListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double totalPrice});
}

/// @nodoc
class __$$GetCartListImplCopyWithImpl<$Res>
    extends _$GetCartEventCopyWithImpl<$Res, _$GetCartListImpl>
    implements _$$GetCartListImplCopyWith<$Res> {
  __$$GetCartListImplCopyWithImpl(
      _$GetCartListImpl _value, $Res Function(_$GetCartListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPrice = null,
  }) {
    return _then(_$GetCartListImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GetCartListImpl implements GetCartList {
  const _$GetCartListImpl(this.userId, this.totalPrice);

  @override
  final String userId;
  @override
  final double totalPrice;

  @override
  String toString() {
    return 'GetCartEvent.getCartList(userId: $userId, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCartListImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCartListImplCopyWith<_$GetCartListImpl> get copyWith =>
      __$$GetCartListImplCopyWithImpl<_$GetCartListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId, double totalPrice) getCartList,
  }) {
    return getCartList(userId, totalPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId, double totalPrice)? getCartList,
  }) {
    return getCartList?.call(userId, totalPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId, double totalPrice)? getCartList,
    required TResult orElse(),
  }) {
    if (getCartList != null) {
      return getCartList(userId, totalPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCartList value) getCartList,
  }) {
    return getCartList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCartList value)? getCartList,
  }) {
    return getCartList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCartList value)? getCartList,
    required TResult orElse(),
  }) {
    if (getCartList != null) {
      return getCartList(this);
    }
    return orElse();
  }
}

abstract class GetCartList implements GetCartEvent {
  const factory GetCartList(final String userId, final double totalPrice) =
      _$GetCartListImpl;

  @override
  String get userId;
  @override
  double get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$GetCartListImplCopyWith<_$GetCartListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetCartState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Cart>? get cart => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Cart>>> get cartSuccessFailureOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCartStateCopyWith<GetCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCartStateCopyWith<$Res> {
  factory $GetCartStateCopyWith(
          GetCartState value, $Res Function(GetCartState) then) =
      _$GetCartStateCopyWithImpl<$Res, GetCartState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Cart>? cart,
      double totalPrice,
      Option<Either<MainFailure, List<Cart>>> cartSuccessFailureOption});
}

/// @nodoc
class _$GetCartStateCopyWithImpl<$Res, $Val extends GetCartState>
    implements $GetCartStateCopyWith<$Res> {
  _$GetCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cart = freezed,
    Object? totalPrice = null,
    Object? cartSuccessFailureOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      cartSuccessFailureOption: null == cartSuccessFailureOption
          ? _value.cartSuccessFailureOption
          : cartSuccessFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Cart>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCartStateImplCopyWith<$Res>
    implements $GetCartStateCopyWith<$Res> {
  factory _$$GetCartStateImplCopyWith(
          _$GetCartStateImpl value, $Res Function(_$GetCartStateImpl) then) =
      __$$GetCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Cart>? cart,
      double totalPrice,
      Option<Either<MainFailure, List<Cart>>> cartSuccessFailureOption});
}

/// @nodoc
class __$$GetCartStateImplCopyWithImpl<$Res>
    extends _$GetCartStateCopyWithImpl<$Res, _$GetCartStateImpl>
    implements _$$GetCartStateImplCopyWith<$Res> {
  __$$GetCartStateImplCopyWithImpl(
      _$GetCartStateImpl _value, $Res Function(_$GetCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cart = freezed,
    Object? totalPrice = null,
    Object? cartSuccessFailureOption = null,
  }) {
    return _then(_$GetCartStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cart: freezed == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      cartSuccessFailureOption: null == cartSuccessFailureOption
          ? _value.cartSuccessFailureOption
          : cartSuccessFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Cart>>>,
    ));
  }
}

/// @nodoc

class _$GetCartStateImpl implements _GetCartState {
  const _$GetCartStateImpl(
      {required this.isLoading,
      final List<Cart>? cart,
      required this.totalPrice,
      required this.cartSuccessFailureOption})
      : _cart = cart;

  @override
  final bool isLoading;
  final List<Cart>? _cart;
  @override
  List<Cart>? get cart {
    final value = _cart;
    if (value == null) return null;
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double totalPrice;
  @override
  final Option<Either<MainFailure, List<Cart>>> cartSuccessFailureOption;

  @override
  String toString() {
    return 'GetCartState(isLoading: $isLoading, cart: $cart, totalPrice: $totalPrice, cartSuccessFailureOption: $cartSuccessFailureOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCartStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(
                    other.cartSuccessFailureOption, cartSuccessFailureOption) ||
                other.cartSuccessFailureOption == cartSuccessFailureOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_cart),
      totalPrice,
      cartSuccessFailureOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCartStateImplCopyWith<_$GetCartStateImpl> get copyWith =>
      __$$GetCartStateImplCopyWithImpl<_$GetCartStateImpl>(this, _$identity);
}

abstract class _GetCartState implements GetCartState {
  const factory _GetCartState(
      {required final bool isLoading,
      final List<Cart>? cart,
      required final double totalPrice,
      required final Option<Either<MainFailure, List<Cart>>>
          cartSuccessFailureOption}) = _$GetCartStateImpl;

  @override
  bool get isLoading;
  @override
  List<Cart>? get cart;
  @override
  double get totalPrice;
  @override
  Option<Either<MainFailure, List<Cart>>> get cartSuccessFailureOption;
  @override
  @JsonKey(ignore: true)
  _$$GetCartStateImplCopyWith<_$GetCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
