// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wishlist _$WishlistFromJson(Map<String, dynamic> json) {
  return _Wishlist.fromJson(json);
}

/// @nodoc
mixin _$Wishlist {
  String get wishListId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishlistCopyWith<Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistCopyWith<$Res> {
  factory $WishlistCopyWith(Wishlist value, $Res Function(Wishlist) then) =
      _$WishlistCopyWithImpl<$Res, Wishlist>;
  @useResult
  $Res call({String wishListId, String userId, List<Product> products});
}

/// @nodoc
class _$WishlistCopyWithImpl<$Res, $Val extends Wishlist>
    implements $WishlistCopyWith<$Res> {
  _$WishlistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishListId = null,
    Object? userId = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      wishListId: null == wishListId
          ? _value.wishListId
          : wishListId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WishlistCopyWith<$Res> implements $WishlistCopyWith<$Res> {
  factory _$$_WishlistCopyWith(
          _$_Wishlist value, $Res Function(_$_Wishlist) then) =
      __$$_WishlistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String wishListId, String userId, List<Product> products});
}

/// @nodoc
class __$$_WishlistCopyWithImpl<$Res>
    extends _$WishlistCopyWithImpl<$Res, _$_Wishlist>
    implements _$$_WishlistCopyWith<$Res> {
  __$$_WishlistCopyWithImpl(
      _$_Wishlist _value, $Res Function(_$_Wishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishListId = null,
    Object? userId = null,
    Object? products = null,
  }) {
    return _then(_$_Wishlist(
      wishListId: null == wishListId
          ? _value.wishListId
          : wishListId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wishlist implements _Wishlist {
  const _$_Wishlist(
      {required this.wishListId,
      required this.userId,
      required final List<Product> products})
      : _products = products;

  factory _$_Wishlist.fromJson(Map<String, dynamic> json) =>
      _$$_WishlistFromJson(json);

  @override
  final String wishListId;
  @override
  final String userId;
  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'Wishlist(wishListId: $wishListId, userId: $userId, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wishlist &&
            (identical(other.wishListId, wishListId) ||
                other.wishListId == wishListId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wishListId, userId,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishlistCopyWith<_$_Wishlist> get copyWith =>
      __$$_WishlistCopyWithImpl<_$_Wishlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishlistToJson(
      this,
    );
  }
}

abstract class _Wishlist implements Wishlist {
  const factory _Wishlist(
      {required final String wishListId,
      required final String userId,
      required final List<Product> products}) = _$_Wishlist;

  factory _Wishlist.fromJson(Map<String, dynamic> json) = _$_Wishlist.fromJson;

  @override
  String get wishListId;
  @override
  String get userId;
  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistCopyWith<_$_Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}
