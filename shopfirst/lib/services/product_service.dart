import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/models/product/product_model.dart';

class ProductService {
  final db = FirebaseFirestore.instance.collection('products');


  Future<void> addProduct({
    required String id,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required String imageUrl,
  }) async {
    Product product = Product(id: id, name: name, description: description, price: price, quantity: quantity, category: category, imageUrl: imageUrl);
    try {
      await db
          .add(product.toJson()); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }



}
