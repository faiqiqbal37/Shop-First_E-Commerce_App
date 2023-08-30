import 'package:flutter/material.dart';
import '../app/app.locator.dart';
import '../models/product/product_model.dart';
import '../services/cart_service.dart';

class CartItem extends StatefulWidget {
  final Product cartItem;
  final Function() handleClick;

  CartItem({required this.cartItem, required this.handleClick});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1; // Initial quantity
  final cartService = locator<CartService>();

  void _incrementQuantity(String productId) {
    setState(() {
      cartService.increaseQuantity(productId);
    });
  }

  void _decrementQuantity() {
    setState(() {
      cartService.decreaseQuantity(widget.cartItem.id);
      cartService.removeFromCart(widget.cartItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Image(image: NetworkImage(widget.cartItem.imageUrl)),
        title: Text("${widget.cartItem.name}"),
        subtitle: Text('PKR: ${widget.cartItem.price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // You can also update the cart service here if needed
                _decrementQuantity();
                widget.handleClick();
              },
              icon: Icon(Icons.remove),
            ),
            Text("${widget.cartItem.cartQuantity}"),
            IconButton(
              onPressed: () {
                cartService.increaseQuantity(widget.cartItem.id);
                widget.handleClick();

                // You can also update the cart service here if needed
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
