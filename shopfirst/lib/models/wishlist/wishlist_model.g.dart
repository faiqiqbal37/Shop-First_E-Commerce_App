// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wishlist _$$_WishlistFromJson(Map<String, dynamic> json) => _$_Wishlist(
      wishListId: json['wishListId'] as String,
      userId: json['userId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WishlistToJson(_$_Wishlist instance) =>
    <String, dynamic>{
      'wishListId': instance.wishListId,
      'userId': instance.userId,
      'products': instance.products,
    };
