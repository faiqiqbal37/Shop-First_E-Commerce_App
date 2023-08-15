import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_item_viewmodel.dart';

class ProductItemView extends StackedView<ProductItemViewModel> {
  const ProductItemView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductItemViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add),
            SizedBox(height: 16),
            Text(
              "Title",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Description",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Price',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to add product to cart
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProductItemViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductItemViewModel();
}
