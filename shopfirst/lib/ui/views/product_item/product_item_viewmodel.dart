import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/models/product/product_model.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/cart_service.dart';
import 'package:shopfirst/services/product_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class ProductItemViewModel extends BaseViewModel {
  Product product;
  ProductItemViewModel({required this.product});

  final authController = locator<AuthenticationService>();
  final productService = locator<ProductService>();
  final cartService = locator<CartService>();

  final db = FirebaseFirestore.instance.collection('wishlist');

  Future<void> addToWishList() async {
    print("Print 1");
    await productService.addToWishList(
        product, authController.userToken!.userId);
  }

  void getProductsBasedOnCategory(String category) {
    productService.getProductsBasedOnCategory(category);
  }

  Future<void> addProductToCart(Product product) async {
    await cartService.addProductToCart(product);
    rebuildUi();
  }
}
