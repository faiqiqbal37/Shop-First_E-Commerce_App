import 'package:shopfirst/models/product/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_model.freezed.dart';
part 'wishlist_model.g.dart';

@freezed
class Wishlist with _$Wishlist {
  const factory Wishlist({
    required String wishListId,
    required String userId,
    required List<Product> products,
  }) = _Wishlist;

  factory Wishlist.fromJson(Map<String, dynamic> json) =>
      _$WishlistFromJson(json);
}
