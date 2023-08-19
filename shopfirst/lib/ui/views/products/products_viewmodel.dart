import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/services/product_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../../app/app.locator.dart';
import '../../../models/product/product_model.dart';

class ProductsViewModel extends BaseViewModel {
  final navigationController = locator<NavigationService>();
  final productService = locator<ProductService>();

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

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getProducts() async {
    return productService.getProducts();
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
