import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Product_Card.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/Navigation_Drawer.dart';
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
      appBar: AppBar(title: Text("Products"),
          actions: [
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
            // IconButton(
            //     onPressed: () =>
            //     {viewModel.addProduct(id: viewModel.uuid.v4(), name: "Samsung Galaxy s22", description: "Sasmung's Flagship Android Smartphone", price: 120000, quantity: 25, category: "phone", imageUrl: "https://firebasestorage.googleapis.com/v0/b/shop-first-d5d48.appspot.com/o/iphone.jpg?alt=media&token=a1080c1b-011b-45f3-8347-c50ad4290210")},
            //     icon: Icon(Icons.shopping_cart))
          ]
      ),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),
                  // ProductCard(),

                ],
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
