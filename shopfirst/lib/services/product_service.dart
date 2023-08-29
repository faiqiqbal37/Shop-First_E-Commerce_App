import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/models/product/product_model.dart';
import 'package:shopfirst/models/wishlist/wishlist_model.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/ui/common/ui_helpers.dart';
import 'package:uuid/uuid.dart';

import '../app/app.locator.dart';

class ProductService {
  final db = FirebaseFirestore.instance.collection('products');
  final dbWishlist = FirebaseFirestore.instance.collection('wishlist');

  final authService = locator<AuthenticationService>();

  Wishlist wishList = Wishlist(wishListId: 'id', userId: 'id', products: []);

  List<Product> products = [];
  late List<Product> productsBasedOnACategory = products;

  bool isSelected =
      false; // bool to check the color of selected navbar category
  String selectedCategory =
      ''; // var to check the current selected category on the products view

  void setCategory(String category) {
    this.selectedCategory = category;
  }

  String getCategory() {
    return this.selectedCategory;
  }

  void getProductsBasedOnCategory(String category) {
    List<Product> productList = [];
    category = category.toLowerCase();
    products.forEach((element) {
      if (element.category.toLowerCase() == category) {
        productList.add(element);
      }
    });
    productsBasedOnACategory = productList;
  }

  Future<void> getAllProducts() async {
    print("In Functionsss");
    QuerySnapshot querySnapshot = await db.get();
    print("In Functionsss");
    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      Product product = Product.fromJson(data);
      products.add(product);
    });
    print("The List of Products Is: ${products}");
  }

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

  Future<void> addToWishList(Product product, String userId) async {
    print("Print 2");
    final uuid = Uuid();
    print("In Function ");
    List<Product> tempList = [];
    QuerySnapshot querySnapshot =
        await dbWishlist.where('userId', isEqualTo: userId).get();

    if (querySnapshot.docs.isNotEmpty) {
      print("Print 3");
      querySnapshot.docs.forEach((docs) {
        Map<String, dynamic> wishList = docs.data() as Map<String, dynamic>;
        Wishlist tempWishlist = Wishlist.fromJson(wishList);
        print("In Function1");
        tempList = tempWishlist.products;
        print("Products Are: $tempList");
        tempWishlist.products.forEach((element) {
          print("Products Are: $element");

          if (element == null) {
            tempList.add(product);
            dbWishlist.doc(tempWishlist.wishListId).update({
              'products': tempList,
            });
          }

          if (element.id == product.id) {
          } else {
            print("In Function");
            tempList.add(element);
            dbWishlist.doc(tempWishlist.wishListId).update({
              'products': tempList,
            });
          }
        });
      });
    } else {
      print("Print 4");
      String wishlistId = uuid.v4();
      tempList.add(product);
      print("Products Are: $tempList");
      Wishlist tempWishList = Wishlist(
          wishListId: wishlistId,
          userId: authService.userToken!.userId,
          products: tempList);
      FirebaseFirestore.instance
          .collection('wishlist')
          .doc(wishlistId)
          .set(tempWishList.toJson());
    }
  }
}
