import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/models/cart/cart_model.dart';
import 'package:shopfirst/models/order/order_model.dart' as OrderModel;
import 'package:shopfirst/models/product/product_model.dart';
import 'package:shopfirst/services/authentication_service.dart' ;
import 'package:shopfirst/services/cart_service.dart';
import 'package:uuid/uuid.dart';

class OrderService {
  Uuid uuid = Uuid();

  final db = FirebaseFirestore.instance.collection('orders');

  final authService = locator<AuthenticationService>();
  final cartService = locator<CartService>();

  OrderModel.Order order = OrderModel.Order(orderId: 'orderid', userId: 'id', products: [], dateTime: DateTime.now(), totalPrice: 0);

  Future<void> initializeOrder() async{
    print("In Print 1");
    String id = uuid.v4();
    String userId = authService.userToken!.userId;
    List<Product> productList = cartService.cartProductsList;
    double totalPrice = 0;
    OrderModel.Order orderTemp = OrderModel.Order(orderId: 'orderid', userId: 'id', products: productList, dateTime: DateTime.now(), totalPrice: 0);
    order = orderTemp.copyWith(userId: userId, products: [], dateTime: DateTime.now(), orderId: id, totalPrice: 0);

    try {
      print("In Print 2");
      await db.doc(id).set(order.toJson()); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }
}
