import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.locator.dart';

import '../services/product_service.dart';
import 'Category_Button.dart';

class CategoryNavbar extends StatefulWidget {
  final Function() handleCallback;

  CategoryNavbar({required this.handleCallback});

  @override
  _CategoryNavbarState createState() => _CategoryNavbarState();
}

class _CategoryNavbarState extends State<CategoryNavbar> {
  final productService = locator<ProductService>();
  final Map<int, String> categories = {
    0: 'Mobile Phone',
    1: 'Electronics',
    2: 'Home & Lifestyle',
    3: 'Outdoor',
    4: 'Automobile',
    5: 'Mens Fashion',
    6: 'Women Fashon'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 40, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            child: CategoryButton(
              isSelected: false,
              categoryName: categories.values.elementAt(index),
              handleCallback: widget.handleCallback,
            ),
          );
        },
      ),
    );
  }
}
