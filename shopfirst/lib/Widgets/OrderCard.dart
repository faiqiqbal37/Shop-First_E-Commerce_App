import 'package:flutter/material.dart';
import 'package:shopfirst/models/order/order_model.dart';

class OrderCard extends StatelessWidget {

  final Order order;


  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Text("Order Id"),
        title: Text("${order.orderId}"),
        subtitle: Text('Total Price: PKR ${order.totalPrice}'),
        ),
      );
  }
}