import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Product_Card_Boxed.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/services/product_service.dart';

import '../models/product/product_model.dart';
import 'Product_Card.dart';

class ProductListBoxed extends StatelessWidget {
  final productService = locator<ProductService>();
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    products = productService.products;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.75, // Adjust this ratio for desired card size
        ),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return products[index].featured == true
              ? ProductCardBoxed(product: products[index])
              : SizedBox();
        },
      ),
    );
  }
}
