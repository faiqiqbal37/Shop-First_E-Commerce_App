import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/services/cart_service.dart';
import 'package:shopfirst/ui/views/product_item/product_item_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../models/product/product_model.dart';

class ProductCard extends StatelessWidget {
  final cartService = locator<CartService>();
  final navigationService = locator<NavigationService>();

  final Product product;
  String category = '';
  final Function() handleCallback;

  ProductCard({required this.product, required this.handleCallback});

  ProductCard.name(this.category, this.product, this.handleCallback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          navigationService.navigateToProductItemView(product: product),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListTile(
          leading: Image(
            image: NetworkImage("${product.imageUrl}"),
          ),
          title: Text("${product.name}"),
          subtitle: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text("PKR ${product.price}"),
                Text("Category: ${product.category}"),
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  cartService.addProductToCart(product);
                  handleCallback();
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
