import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopfirst/services/cart_service.dart';
import 'package:shopfirst/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../../app/app.locator.dart';
import '../../../models/product/product_model.dart';

class ProductsViewModel extends BaseViewModel {
  final navigationController = locator<NavigationService>();
  final productService = locator<ProductService>();
  final cartService = locator<CartService>();

  final TextEditingController categoryController = TextEditingController();

  final db = FirebaseFirestore.instance.collection('products');
  //final List<Product> cartProductsList = [];

  final Uuid uuid = Uuid();

  Future<void> addProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required String imageUrl,
  }) async {
    productService.addProduct(
        id: id,
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        imageUrl: imageUrl);
  }

  int getProductCountInCart() {
    print("The Count is: ${cartService.cartProductsList.length}");
    return cartService.cartProductsList.length;
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getProducts() async {
    return productService.getProducts();
  }

  void setCategory(String category) {
    productService.setCategory(category);
  }

  void getProductsBasedOnCategory(String category) {
    productService.getProductsBasedOnCategory(category);
    rebuildUi();
  }

  String getCategory() {
    return productService.getCategory();
  }

  void addProductToCart(Product product) {
    cartService.addProductToCart(product);
    rebuildUi();
  }

  void handleCallback() {
    rebuildUi();
  }

  List<Product> products = [
    Product(
        id: "02",
        name: "Samsung",
        description: "Mobile Phone",
        price: 5500,
        quantity: 4,
        category: "Phone",
        imageUrl:
            "https://pixabay.com/photos/water-waves-ocean-shore-coast-3354067/"),
    Product(
        id: "02",
        name: "Samsung",
        description: "Mobile Phone",
        price: 5500,
        quantity: 4,
        category: "Phone",
        imageUrl:
            "https://pixabay.com/photos/water-waves-ocean-shore-coast-3354067/"),
    Product(
        id: "02",
        name: "Samsung",
        description: "Mobile Phone",
        price: 5500,
        quantity: 4,
        category: "Phone",
        imageUrl:
            "https://pixabay.com/photos/water-waves-ocean-shore-coast-3354067/"),
    Product(
        id: "02",
        name: "Samsung",
        description: "Mobile Phone",
        price: 5500,
        quantity: 4,
        category: "Phone",
        imageUrl:
            "https://pixabay.com/photos/water-waves-ocean-shore-coast-3354067/"),
  ];
}
