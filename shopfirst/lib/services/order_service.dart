import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/models/cart/cart_model.dart';
import 'package:shopfirst/models/order/order_model.dart' as OrderModel;
import 'package:shopfirst/models/product/product_model.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/cart_service.dart';
import 'package:uuid/uuid.dart';

class OrderService {
  Uuid uuid = Uuid();

  final db = FirebaseFirestore.instance.collection('orders');

  final authService = locator<AuthenticationService>();
  final cartService = locator<CartService>();

  List<OrderModel.Order> orders = [];

  double totalPriceOfOrder = 0;

  OrderModel.Order order = OrderModel.Order(
      orderId: 'orderid',
      userId: 'id',
      products: [],
      totalPrice: 0);

  Future<void> initializeOrder() async {
    String id = uuid.v4();
    String userId = authService.userToken!.userId;

    try {
      List<Map<String, dynamic>> productListJson = cartService.cartProductsList
          .map((product) => product.toJson())
          .toList();

      await db.doc(id).set({
        'orderId': id,
        'userId': userId,
        'products': FieldValue.arrayUnion(productListJson),
        'totalPrice': cartService.totalCartPrice,
      }); // Use .toJson() function
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  Future<void> getAllOrders(String userId) async{
    QuerySnapshot querySnapshot = await db.where('userId', isEqualTo: userId).get();
    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      OrderModel.Order order = OrderModel.Order.fromJson(data);
      // OrderModel.Order tempOrder = OrderModel.Order(orderId: data['orderId'] as String,
      //   userId: data['userId'] as String,
      //   products: data['products'] as List<Product>,
      //   totalPrice: data['totalPrice'] as double);
      orders.add(order);
    });
    print("The Orders Are: $orders");

  }
}
