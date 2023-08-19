import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        IconButton(
            onPressed: () =>
                {viewModel.navigationController.navigateToCartView()},
            icon: Icon(Icons.shopping_cart)),
        // A demo function to add static products in firebase
        IconButton(
            onPressed: () => {
                  viewModel.addProduct(
                      id: viewModel.uuid.v4(),
                      name: "Iphone 12",
                      description: "Apples's Flagship Smartphone",
                      price: 100000,
                      quantity: 20,
                      category: "phone",
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/shop-first-d5d48.appspot.com/o/iphone.jpg?alt=media&token=a1080c1b-011b-45f3-8347-c50ad4290210")
                },
            icon: Icon(Icons.shopping_cart))
      ]),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.cyan,
            height: 90,
          ),
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No products available');
                  } else {
                    final products = snapshot.data!.docs
                        .map((doc) => Product.fromJson(
                            doc.data() as Map<String, dynamic>))
                        .toList();

                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products.elementAt(index);
                        return ProductCard(product: product);
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
