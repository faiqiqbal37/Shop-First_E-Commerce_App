import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:shopfirst/ui/common/app_colors.dart';
import 'package:shopfirst/ui/common/ui_helpers.dart';
import 'package:shopfirst/Widgets/Navigation_Drawer.dart';

import '../../../Widgets/Custom_Scaffold.dart';
import '../../../Widgets/Product_Card.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  // dummy data for testing
  static List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2017/04/03/15/52/mobile-phone-2198770_640.png',
    'https://cdn.pixabay.com/photo/2017/04/03/15/52/mobile-phone-2198770_640.png',
    'https://cdn.pixabay.com/photo/2017/04/03/15/52/mobile-phone-2198770_640.png',
    // Add more image URLs
  ];

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
            IconButton(
                onPressed: () =>
                    {viewModel.navigationController.navigateToCartView()},
                icon: Icon(Icons.shopping_cart))
          ]),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            color: Colors.white,
            height: 90,
            child: Wrap(
              children: [
                SizedBox(
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: "Search",
                          prefixIcon: Icon(Icons.search),
                          iconColor: Colors.black)),
                  height: 40,
                  width: 330,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    height: 180,
                    child: CarouselSlider(
                      items: imageUrls.map(
                        (imageUrl) {
                          print(imageUrl);
                          return Image.network(imageUrl, fit: BoxFit.cover);
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
                    color: Colors.red,
                    height: 245,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(""),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                      ],
                    ),
                  ),

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
