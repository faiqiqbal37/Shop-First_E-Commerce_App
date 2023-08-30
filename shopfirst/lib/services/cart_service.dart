import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/models/cart/cart_model.dart';
import 'package:shopfirst/models/product/product_model.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:uuid/uuid.dart';

import '../app/app.locator.dart';

class CartService {
  final db = FirebaseFirestore.instance.collection('cart');

  bool initializerFlag = false;

  double totalCartPrice = 0;
  final authService = locator<AuthenticationService>();
  final uuid = Uuid();

  List<Product> cartProductsList = [];
  Cart cart = Cart(cartId: '0', userId: '0', products: [], totalPrice: 0);

  Future<void> initializeCart() async {
    String id = uuid.v4();
    String userId = authService.userToken!.userId;
    Cart cartTemp = Cart.initialze(id, userId);
    cart = cartTemp.copyWith(
        userId: userId,
        cartId: id,
        totalPrice: totalCartPrice,
        products: cartProductsList);

    try {
      List<Map<String, dynamic>> productListJson =
          cartProductsList.map((product) => product.toJson()).toList();

      await db.doc(id).set({
        'userId': userId,
        'cartId': id,
        'totalPrice': totalCartPrice,
        'products': FieldValue.arrayUnion(productListJson),
      }); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  Future<void> addProductToCart(Product product) async {
    // decreasing quantity if the product exists
    print("The Cart Is $cartProductsList");
    for (int i = 0; i < cartProductsList.length; i++) {
      if (cartProductsList[i].id == product.id) {
        double quantity = cartProductsList[i].quantity;
        double cartQuantity = cartProductsList[i].cartQuantity;
        double totalAmount = cartProductsList[i].totalPriceInCart;
        quantity--;
        cartQuantity++;
        totalAmount = totalAmount + cartProductsList[i].price;
        cartProductsList[i] = cartProductsList[i].copyWith(
            quantity: quantity,
            cartQuantity: cartQuantity,
            totalPriceInCart: totalAmount);
      }
    }
    if (!cartProductsList.contains(product)) {
      print("In Print 2");
      double quantity = product.quantity;
      double cartQuantity = product.cartQuantity;
      double totalAmount = product.totalPriceInCart;
      quantity--;
      cartQuantity++;
      totalAmount = product.price;
      product = product.copyWith(
          quantity: quantity,
          cartQuantity: cartQuantity,
          totalPriceInCart: totalAmount);
      if (cartProductsList.contains(product)) {
        print("Print 3");
      } else {
        for (int i = 0; i < cartProductsList.length; i++) {
          if (cartProductsList[i].id == product.id) {
            print("Print 4");
            cartProductsList[i] = product.copyWith(
                quantity: quantity,
                cartQuantity: cartQuantity,
                totalPriceInCart: totalAmount);
          }
        }

        cartProductsList.add(product);
        print("Print 5");
        product = product.copyWith(
            quantity: quantity,
            cartQuantity: cartQuantity,
            totalPriceInCart: totalAmount);
      }
    }
    cartProductsList.forEach((element) {
      print(
          "Product Name: ${element.name} | Product Quantity: ${element.quantity}  ");
    });

    calculateTotalPrice();

    // try {
    //   print('Pushing Cart................');
    //   await db.doc(cart.cartId).set(cart.toJson()); // Use .toJson() function
    // } catch (e) {
    //   print('Error adding cart: $e');
    //   rethrow;
    // }
  }

  void calculateTotalPrice() {
    final List<Product> list = cartProductsList;

    print("The List Is:   $list");

    for (int i = 0; i < list.length; i++) {
      totalCartPrice = list[i].totalPriceInCart + totalCartPrice;
    }
  }

  void removeFromCart(Product product) {
    double price = product.totalPriceInCart;
    price = price - product.price;
    product = product.copyWith(totalPriceInCart: price);

    print("1 :${cartProductsList.length}");
    int length = cartProductsList.length;

    // decreasing quantity if the product exists
    List<Product> temp = [];
    if (cartProductsList.contains(product)) {
      cartProductsList.forEach((element) {
        print("Print 1");
        if (element.id == product.id && element.cartQuantity <= 1) {
          print("Print 2");
          for (int i = 0; i < cartProductsList.length; i++) {
            if (cartProductsList[i].id != element.id) {
              temp.add(cartProductsList[i]);
            } else if (length == 1) {
              print("Print 3");
              cartProductsList = temp;
            }
          }
        }
      });

      if (temp.isNotEmpty) {
        print("Print 3");
        cartProductsList = temp;
        print(cartProductsList);
      }
    }

    // if(!cartProductsList.contains(product)){
    //   double quantity = product.quantity;
    //   quantity--;
    //   product = product.copyWith(quantity: quantity);
    //   cartProductsList.add(product);
    // }
    cartProductsList.forEach((element) {
      print(
          "Product Name: ${element.name} | Product Quantity: ${element.quantity}  ");
    });
  }

  void increaseQuantity(String productId) {
    double count;
    double count2;

    for (int i = 0; i < cartProductsList.length; i++) {
      if (productId == cartProductsList[i].id) {
        count = cartProductsList[i].cartQuantity;
        count2 = cartProductsList[i].quantity;
        count2--;
        count++;
        cartProductsList[i] =
            cartProductsList[i].copyWith(cartQuantity: count, quantity: count2);
      }
    }
  }

  void decreaseQuantity(String productId) {
    double count;
    double count2;
    List<Product> tempList = cartProductsList;

    for (int i = 0; i < tempList.length; i++) {
      if (productId == tempList[i].id) {
        count = tempList[i].cartQuantity;
        count2 = tempList[i].quantity;
        count2++;
        count--;
        tempList[i] =
            tempList[i].copyWith(cartQuantity: count, quantity: count2);
      }
      cartProductsList = tempList;
    }
  }
}
