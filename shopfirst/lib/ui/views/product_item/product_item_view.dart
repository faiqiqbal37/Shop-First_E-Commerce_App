import 'package:flutter/material.dart';
import 'package:shopfirst/models/product/product_model.dart';
import 'package:stacked/stacked.dart';

import 'product_item_viewmodel.dart';

class ProductItemView extends StackedView<ProductItemViewModel> {
  final Product product;

  const ProductItemView({Key? key, required this.product}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductItemViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${viewModel.product.name}"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 305,
              margin: EdgeInsets.only(bottom: 15),
              child: Image.network(viewModel.product.imageUrl,
                  width: 360, height: 305, fit: BoxFit.cover),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
              child: Text("${viewModel.product.name}"),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
              child: Text(
                "PKR: ${viewModel.product.price}",
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
              child:
                  Text("Category: ${viewModel.product.category.toUpperCase()}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () => {viewModel.addProductToCart(product)},
                      child: Text("Add To Cart"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(260, 15),
                      )),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                  child: IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.favorite),
                      onPressed: () => {viewModel.addToWishList()}),
                )
              ],
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
              child: Text("Description: ${viewModel.product.description}"),
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
      ProductItemViewModel(product: product);
}
