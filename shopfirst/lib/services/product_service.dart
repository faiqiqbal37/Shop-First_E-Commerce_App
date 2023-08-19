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
    Product product = Product(
        id: id,
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        imageUrl: imageUrl);
    try {
      await db.add(product.toJson()); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getProducts() async {
    // List<Product> products = List.empty();
    // try {
    //   if (querySnapshot.docs.isNotEmpty) {
    //     querySnapshot.docs.forEach((element) {
    //       Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    //       Product product = Product.fromJson(data);
    //       products.add(product);
    //       print("Product Name: ${product.name}");
    //     });
    //     return products;
    //   }
    // }
    // catch(e){
    //   throw e;
    //   rethrow;
    try {
      return db.snapshots();
    } catch (e) {
      throw e;
    }
  }
}
