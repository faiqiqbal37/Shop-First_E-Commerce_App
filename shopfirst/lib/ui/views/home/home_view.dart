import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/Widgets/Product_List_Boxed.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/ui/views/products/products_view.dart';
import 'package:stacked/stacked.dart';
import 'package:shopfirst/ui/common/app_colors.dart';
import 'package:shopfirst/ui/common/ui_helpers.dart';
import 'package:shopfirst/Widgets/Navigation_Drawer.dart';

import '../../../Widgets/Custom_Scaffold.dart';
import '../../../Widgets/Product_Card.dart';
import '../../../models/product/product_model.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  // dummy data for testing
  static List<String> imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/shop-first-d5d48.appspot.com/o/iphone.jpg?alt=media&token=a1080c1b-011b-45f3-8347-c50ad4290210',
    'https://firebasestorage.googleapis.com/v0/b/shop-first-d5d48.appspot.com/o/samsung%20s22.avif?alt=media&token=c0ca1950-9f70-42ea-8b1f-3faba8b47241',
    'https://cdn.pixabay.com/photo/2017/04/03/15/52/mobile-phone-2198770_640.png',
    // Add more image URLs
  ];

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.getAllProducts();
    viewModel.rebuildUi();
    super.onViewModelReady(viewModel);

  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Shop First"),
          backgroundColor: Colors.lightBlueAccent,
          actions: [
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
            ])
          ]),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   margin: EdgeInsets.only(top: 5),
          //   color: Colors.white,
          //   height: 90,
          //   child: Wrap(
          //     children: [
          //       SizedBox(
          //         child: TextField(
          //             decoration: InputDecoration(
          //                 labelText: "Search",
          //                 prefixIcon: Icon(Icons.search),
          //                 iconColor: Colors.black)),
          //         height: 40,
          //         width: 330,
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    margin: EdgeInsets.only(top: 5),
                    child: CarouselSlider(
                      items: imageUrls.map(
                        (imageUrl) {
                          print(imageUrl);
                          return GestureDetector(
                            child: Image.network(imageUrl, fit: BoxFit.cover),
                            onTap: () => {viewModel.openProductItem(imageUrl)},
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                          height: 180,
                          autoPlay: true,
                          initialPage: 1,
                          enlargeCenterPage: true),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 220,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue),
                    child: Text("Featured Products",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    color: Colors.red,
                    height: 350,
                    child: ProductListBoxed(),
                  ),
                  Container(
                    height: 48,
                    width: 220,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue),
                    child: Text("All Products",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    color: Colors.white,
                    height: 300,
                    child: ListView.builder(
                      itemCount: viewModel.productService.products.length,
                      itemBuilder: (context, index) {
                        final product =
                            viewModel.productService.products.elementAt(index);
                        return ProductCard(
                            handleCallback: viewModel.handleCallback,
                            product: product);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
