
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/services/product_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../models/product/product_model.dart';
import '../services/cart_service.dart';

class WishlistProductCard extends StatelessWidget {
  final productService = locator<ProductService>();
  final navigationService = locator<NavigationService>();

  final Product product;
  String category = '';
  final Function() handleCallback;

  WishlistProductCard({required this.product, required this.handleCallback});

  WishlistProductCard.name(this.category, this.product, this.handleCallback);

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
                  productService.removeFromWishlist(product.id);
                  handleCallback();
                },
                icon: Icon(Icons.remove_circle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
