import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Category_Navbar.dart';
import 'package:shopfirst/Widgets/Product_Card.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/Navigation_Drawer.dart';
import '../../../models/product/product_model.dart';
import 'products_viewmodel.dart';

class ProductsView extends StackedView<ProductsViewModel> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"), actions: [
        IconButton(
          onPressed: () =>
              {viewModel.navigationController.navigateToUserDetailView()},
          icon: Icon(Icons.account_box),
          style: ButtonStyle(),
        ),
        Stack(alignment: Alignment.center, children: [
          IconButton(
              onPressed: () =>
                  {viewModel.navigationController.navigateToCartView()},
              icon: Icon(Icons.shopping_cart)),
          Positioned(
            right: 2,
            top: 2,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${viewModel.getProductCountInCart()}', // Replace with your actual product count
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
        // A demo function to add static products in firebase
        IconButton(
            onPressed: () => {
                  viewModel.addProduct(
                      id: viewModel.uuid.v4(),
                      name: "Haier Washing Machine",
                      description: "Smart Washing Machine",
                      price: 70000,
                      quantity: 51,
                      category: "Electronics",
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/shop-first-d5d48.appspot.com/o/pexels-photo-5591460.jpeg?alt=media&token=84e96441-3837-4c67-a770-34b375efdba8")
                },
            icon: Icon(Icons.shopping_cart))
      ]),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: 100,
            child: Wrap(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                      controller: viewModel.categoryController,
                      onChanged: (value) =>
                          {viewModel.getProductsBasedOnCategory(value)},
                      decoration: InputDecoration(
                          labelText: "Search",
                          prefixIcon: Icon(Icons.search),
                          iconColor: Colors.black)),
                ),
                SizedBox(
                  child:
                      CategoryNavbar(handleCallback: viewModel.handleCallback),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: viewModel.db.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No products available');
                  } else {
                    viewModel.productService.products = snapshot.data!.docs
                        .map((doc) => Product.fromJson(
                            doc.data() as Map<String, dynamic>))
                        .toList();

                    return ListView.builder(
                      itemCount: viewModel
                          .productService.productsBasedOnACategory.length,
                      itemBuilder: (context, index) {
                        final product = viewModel
                            .productService.productsBasedOnACategory
                            .elementAt(index);
                        return ProductCard(
                            handleCallback: viewModel.handleCallback,
                            product: product);
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  ProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductsViewModel();
}
